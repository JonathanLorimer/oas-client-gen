-- |
--   Module      : OAS.Generator.OASType
--   Description : Types and functions for representing open-api schema types
--   Copyright   : (c) Jonathan Lorimer, 2025
--   License     : BSD3
--   Maintainer  : jonathanlorimer@pm.me
--
--   This module provides functions and types for representing open-api schema types.
--   Specifically the 'OASType' aims to be an intermediate representation between the
--   JSON oriented types in the open-api schema and Haskell. The main examples of
--   where these types might come from are respone and request payloads.
module OAS.Generator.OASType where

import Control.Applicative ((<|>))
import Control.Monad
import Control.Monad.Error.Class (MonadError)
import Control.Monad.Except (ExceptT, liftEither, runExceptT)
import Control.Monad.IO.Class (MonadIO (..))
import Control.Monad.State (StateT (..), modify, get)
import Control.Monad.State.Class (MonadState)
import Data.Bifunctor (Bifunctor (..))
import Data.Functor ((<&>))
import Data.List (last)
import Data.List.NonEmpty (NonEmpty)
import Data.List.NonEmpty qualified as NE
import Data.Map (Map)
import Data.Map.Lazy qualified as M
import Data.Maybe (isJust)
import Data.Set (Set)
import Data.Set qualified as S
import Data.Text (Text)
import Data.Text qualified as T
import Data.Traversable (for)
import OAS.Generator.Environment (FromRefRecError (..), fromRef, fromRefRec)
import OAS.Schema.Ref (OrRef (..), Ref (..))
import OAS.Schema.SchemaObject
  ( AdditionalProperties (..)
  , Items (..)
  , Schema (..)
  , SchemaType (..)
  , SchemaTypeValue (..)
  , emptySchema
  )
import Text.Casing
import Text.Casing (fromAny, toPascal)

-- | Escape Haskell reserved keywords by appending '_'
escapeReservedKeyword :: Text -> Text
escapeReservedKeyword t =
  if t `elem` haskellReservedKeywords
    then t <> "_"
    else t
 where
  -- List of Haskell reserved keywords
  haskellReservedKeywords =
    [ "case"
    , "class"
    , "data"
    , "default"
    , "deriving"
    , "do"
    , "else"
    , "foreign"
    , "if"
    , "import"
    , "in"
    , "infix"
    , "infixl"
    , "infixr"
    , "instance"
    , "let"
    , "module"
    , "newtype"
    , "of"
    , "then"
    , "type"
    , "where"
    ]

data OASType
  = OASPrim OASPrimTy
  | OASArray OASType
  | OASObject Record
  | OASMaybe OASType
  | OASEnum Text [OASType]
  | OASMap -- Represents Map Text Value for free-form objects
  | OASRef Text -- Reference to a named type (for handling cycles)
  deriving (Eq, Ord, Show)

data OASPrimTy
  = PrimString
  | PrimInt
  | PrimFloat
  | PrimBool
  deriving (Eq, Ord, Show)

data Key = Key {json :: Text, haskell :: Text}
  deriving (Eq, Ord, Show)

data Record = Record
  { constructor :: Text
  , fields :: Map Key OASType
  }
  deriving (Eq, Ord, Show)

-- | Extract the type name from an OASType
getTypeName :: OASType -> Maybe Text
getTypeName = \case
  OASPrim _ -> Nothing
  OASArray _ -> Nothing
  OASObject r -> Just r.constructor
  OASMaybe _ -> Nothing
  OASEnum name _ -> Just name
  OASMap -> Nothing
  OASRef name -> Just name

fromRefRecSchemaT :: (Monad m) => Map Text (OrRef a) -> OrRef a -> SchemaT m a
fromRefRecSchemaT env orRef = liftEither $ flip first (fromRefRec env orRef) \case
  MissingRef r -> DanglingReference r
  RefCycleDetected path -> ReferenceCycle path

fromRefSchemaT :: (MonadIO m) => Map Text a -> OrRef a -> SchemaT m a
fromRefSchemaT env = liftEither . first DanglingReference . fromRef env

-- Helper to convert a reference like "#/components/schemas/Foo" to "Foo"
refToTypeName :: Text -> Text
refToTypeName ref = case T.splitOn "/" ref of
  parts | not (null parts) -> last parts
  _ -> ref

fromOrRefSchema
  :: (MonadIO m) => Map Text (OrRef Schema) -> Maybe Text -> OrRef Schema -> SchemaT m SchemaResult
fromOrRefSchema env mt orRef = fst <$> fromOrRefSchemaWithVisited env S.empty mt orRef

fromOrRefSchemaWithVisited
  :: (MonadIO m)
  => Map Text (OrRef Schema)
  -> Set Text
  -> Maybe Text
  -> OrRef Schema
  -> SchemaT m (SchemaResult, Set Text)
fromOrRefSchemaWithVisited env visited mt orRef =
  case orRef of
    ByReference ref | ref.ref `S.member` visited -> do
      -- Detected a cycle - return a reference to the type being defined
      let
        typeName = T.pack . toPascal . fromAny . T.unpack $ refToTypeName ref.ref
      -- Register this reference name to avoid collisions
      modify \tyInfo ->
        tyInfo { usedNames = S.insert typeName tyInfo.usedNames }
      pure (Type (OASRef typeName), visited)
    ByReference ref -> do
      -- When processing a reference, use the reference name as the type name
      let
        refTypeName = T.pack . toPascal . fromAny . T.unpack $ refToTypeName ref.ref
      -- Check if we've already generated this type
      currentState <- get
      let
        -- Check if a type with this name already exists in our types
        typeAlreadyExists = any (\t -> getTypeName t == Just refTypeName) (S.toList currentState.types)
      if typeAlreadyExists
        then do
          -- Type already exists, just return a reference to it
          pure (Type (OASRef refTypeName), visited)
        else do
          -- Generate the type for the first time
          (schema, visited') <- fromRefRecSchemaWithVisited env visited orRef
          -- Pass refTypeName as mt to ensure consistency with OASRef
          -- Pass True for isReference since this schema comes from a reference
          result <- fromSchemaWithVisited env visited' True (Just refTypeName <|> mt) schema
          pure (result, visited')
    Direct _ -> do
      (schema, visited') <- fromRefRecSchemaWithVisited env visited orRef
      -- For direct schemas, pass False since they are inline and can have name collisions
      result <- fromSchemaWithVisited env visited' False mt schema
      pure (result, visited')

fromRefRecSchemaWithVisited
  :: forall m a. (MonadIO m) => Map Text (OrRef a) -> Set Text -> OrRef a -> SchemaT m (a, Set Text)
fromRefRecSchemaWithVisited env visited = go visited []
 where
  go :: Set Text -> [Text] -> OrRef a -> SchemaT m (a, Set Text)
  go vis path = \case
    ByReference r -> do
      if r.ref `S.member` vis
        then do
          -- We've detected a cycle - return an error
          liftEither . Left . ReferenceCycle $ r.ref NE.:| reverse path
        else do
          case M.lookup r.ref env of
            Nothing -> liftEither . Left . DanglingReference $ r
            Just s -> do
              let
                newVis = S.insert r.ref vis
              go newVis (r.ref : path) s
    Direct s -> pure (s, vis)

data SchemaResult = Type OASType | EmptySchema
  deriving (Eq, Ord, Show)

data TypeInfo = TypeInfo
  { types :: Set OASType
  , usedNames :: Set Text  -- Track names that have been used
  }
  deriving (Show, Eq)

emptyTypeGraph :: TypeInfo
emptyTypeGraph = TypeInfo S.empty S.empty

-- | Generate a unique name, appending numbers if needed
uniqueName :: Set Text -> Text -> Text
uniqueName usedNames baseName
  | baseName `S.notMember` usedNames = baseName
  | otherwise = go 1
  where
    go :: Int -> Text
    go n =
      let candidate = baseName <> "_" <> T.pack (show n)
      in if candidate `S.member` usedNames
         then go (n + 1)
         else candidate

data SchemaError
  = MissingTypeField Schema (Maybe Text)
  | MissingEnumPrefix Schema
  | MissingRecordConstructor Schema
  | MissingRecordFields Schema
  | MissingArrayTypes Schema
  | EmptyArray Schema
  | DanglingReference Ref
  | ReferenceCycle (NonEmpty Text)
  deriving (Eq, Show)

newtype SchemaT m a = SchemaT {action :: ExceptT SchemaError (StateT TypeInfo m) a}
  deriving newtype (Functor, Applicative, Monad, MonadError SchemaError, MonadState TypeInfo, MonadIO)

runSchemaT :: (Monad m) => SchemaT m a -> TypeInfo -> m (Either SchemaError a, TypeInfo)
runSchemaT schemaT = runStateT (runExceptT schemaT.action)

fromSchema
  :: forall m. (MonadIO m) => Map Text (OrRef Schema) -> Maybe Text -> Schema -> SchemaT m SchemaResult
fromSchema env = fromSchemaWithVisited env S.empty False

fromSchemaWithVisited
  :: forall m. (MonadIO m) => Map Text (OrRef Schema) -> Set Text -> Bool -> Maybe Text -> Schema -> SchemaT m SchemaResult
fromSchemaWithVisited env visited isReference mt s = do
  if s == emptySchema
    then pure EmptySchema
    else case s.schemaType of
      -- Handle single type
      Just (SingleType st) -> handleSchemaType st
      -- Handle multiple types (e.g., ["number", "null"])
      Just (MultipleTypes sts) ->
        if S.member SchemaNull sts && S.size sts == 2
          then -- This is a nullable type

            let
              nonNullType = S.toList $ S.delete SchemaNull sts
            in
              case nonNullType of
                [t] -> do
                  result <- handleSchemaType t
                  case result of
                    EmptySchema -> pure EmptySchema
                    Type oasType -> pure . Type $ OASMaybe oasType
                _ -> handleNoType -- Fall back to anyOf handling
          else handleNoType -- Multiple non-nullable types not supported yet
      Nothing -> handleNoType
 where
  handleSchemaType :: SchemaType -> SchemaT m SchemaResult
  handleSchemaType SchemaString = pure . Type . OASPrim $ PrimString
  handleSchemaType SchemaNumber = pure . Type . OASPrim $ PrimFloat
  handleSchemaType SchemaInteger = pure . Type . OASPrim $ PrimInt
  handleSchemaType SchemaBoolean = pure . Type . OASPrim $ PrimBool
  handleSchemaType SchemaNull = pure EmptySchema
  handleSchemaType SchemaArray = do
    is <- liftEither $ maybe (Left $ EmptyArray s) Right s.items
    mkArray (s.title <|> mt) is
  handleSchemaType SchemaObject = do
    -- Check if this is a free-form object (no properties but additionalProperties is set)
    if s.properties == M.empty && isJust s.additionalProperties
      then pure . Type $ OASMap
      else
        if s.properties == M.empty
          then pure EmptySchema -- Empty object {} - treat as unit type
          else do
            baseCtr <- liftEither $ maybe (Left $ MissingRecordConstructor s) Right $ s.title <|> mt
            -- Get current state to check used names
            currentState <- get
            let
              -- Only use uniqueName if this is not a reference
              uniqueCtr = if isReference then baseCtr else uniqueName currentState.usedNames baseCtr

            -- Thread visited set through all properties
            (fields, _finalVisited) <-
              foldM
                ( \(accFields, accVisited) (label, orRef) -> do
                    let
                      key = Key label (escapeReservedKeyword $ T.pack . toCamel . fromAny $ T.unpack label)
                    -- Use field name as type hint only for inline objects, not references
                    let
                      fieldTypeHint = case orRef of
                        ByReference _ -> Nothing  -- References should use their canonical name
                        Direct _ -> Just $ T.pack . toPascal . fromAny $ T.unpack label
                    (result, newVisited) <- fromOrRefSchemaWithVisited env accVisited fieldTypeHint orRef
                    pure ((key, result) : accFields, newVisited)
                )
                ([], visited)
                (M.toList s.properties)

            let
              obj =
                OASObject $
                  Record
                    (T.pack . toPascal . fromAny $ T.unpack uniqueCtr)
                    (filterEmptySchema $ M.fromList fields)

            modify \tyInfo ->
              tyInfo
                { types = S.insert obj tyInfo.types
                , usedNames = S.insert uniqueCtr tyInfo.usedNames
                }
            pure . Type $ obj

  handleNoType :: SchemaT m SchemaResult
  handleNoType =
    -- Check if this is a free-form object (no type but additionalProperties is set)
    if isJust s.additionalProperties && M.null s.properties
      then pure . Type $ OASMap
      else case (s.anyOf, s.allOf) of
        (Just anys, _) -> do
          basePrefix <- liftEither $ maybe (Left $ MissingEnumPrefix s) Right $ s.title <|> mt
          -- Get current state to check used names
          currentState <- get
          let
            -- Only use uniqueName if this is not a reference
            uniquePrefix = if isReference then basePrefix else uniqueName currentState.usedNames basePrefix
          tys <-
            for
              (NE.toList anys)
              ( \orRef -> do
                  (s', visited') <- fromRefRecSchemaWithVisited env visited orRef
                  -- Pass isReference=False for inline schemas within anyOf
                  fromSchemaWithVisited env visited' False (s'.title <|> mt) s'
              )
          let
            enum = OASEnum uniquePrefix (filterEmpty tys)
          modify \tyGraph ->
            tyGraph
              { types = S.insert enum tyGraph.types
              , usedNames = S.insert uniquePrefix tyGraph.usedNames
              }
          pure . Type $ enum
        (Nothing, Just alls) -> do
          -- For allOf, we should ideally merge all schemas, but for now treat it like anyOf
          -- This is a simplification - proper allOf handling would merge properties
          basePrefix <- liftEither $ maybe (Left $ MissingEnumPrefix s) Right $ s.title <|> mt
          -- Get current state to check used names
          currentState <- get
          let
            -- Only use uniqueName if this is not a reference
            uniquePrefix = if isReference then basePrefix else uniqueName currentState.usedNames basePrefix
          tys <-
            for
              (NE.toList alls)
              ( \orRef -> do
                  (s', visited') <- fromRefRecSchemaWithVisited env visited orRef
                  -- Pass isReference=False for inline schemas within allOf
                  fromSchemaWithVisited env visited' False (s'.title <|> mt) s'
              )
          let
            enum = OASEnum uniquePrefix (filterEmpty tys)
          modify \tyGraph ->
            tyGraph
              { types = S.insert enum tyGraph.types
              , usedNames = S.insert uniquePrefix tyGraph.usedNames
              }
          pure . Type $ enum
        (Nothing, Nothing) ->
          -- If no type and no anyOf/allOf, treat as free-form object (like 'any' type)
          pure . Type $ OASMap

  mkArray :: Maybe Text -> Items -> SchemaT m SchemaResult
  mkArray mt' = \case
    ItemObject orRef -> do
      (sr, _) <- fromOrRefSchemaWithVisited env visited mt' orRef
      case sr of
        EmptySchema -> liftEither . Left $ EmptyArray s
        Type p@(OASPrim _) -> pure $ Type p
        Type t -> do
          modify \tyInfo ->
            tyInfo
              { types = S.insert t tyInfo.types
              }
          pure . Type $ OASArray t
    ItemArray ss -> do
      prefix <- liftEither $ maybe (Left $ MissingEnumPrefix s) Right mt
      when (null ss) . liftEither . Left $ MissingArrayTypes s
      tys <-
        for
          ss
          ( \orRef -> do
              (s', visited') <- fromRefRecSchemaWithVisited env visited orRef
              -- Pass isReference=False for inline schemas within array
              fromSchemaWithVisited env visited' False (s'.title <|> mt') s'
          )
      let
        enum = OASEnum prefix (filterEmpty tys)
        arr = OASArray enum

      modify \tyInfo ->
        tyInfo
          { types = S.insert enum tyInfo.types
          }
      pure $ Type arr

  filterEmpty :: [SchemaResult] -> [OASType]
  filterEmpty = foldr go []
   where
    go :: SchemaResult -> [OASType] -> [OASType]
    go EmptySchema acc = acc
    go (Type oasTy) acc = oasTy : acc

filterEmptySchema :: Map a SchemaResult -> Map a OASType
filterEmptySchema = M.mapMaybe go'
 where
  go' :: SchemaResult -> Maybe OASType
  go' EmptySchema = Nothing
  go' (Type oasTy) = Just oasTy
