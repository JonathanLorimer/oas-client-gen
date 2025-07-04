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
import Control.Monad.State (StateT (..), modify)
import Control.Monad.State.Class (MonadState)
import Data.Bifunctor (Bifunctor (..))
import Data.Functor ((<&>))
import Data.List.NonEmpty (NonEmpty)
import Data.List.NonEmpty qualified as NE
import Data.Map (Map)
import Data.Map.Lazy qualified as M
import Data.Set (Set)
import Data.Set qualified as S
import Data.Text (Text)
import Data.Text qualified as T
import Data.Traversable (for)
import OAS.Generator.Environment (FromRefRecError (..), fromRef, fromRefRec)
import OAS.Schema.Ref (OrRef (..), Ref (..))
import OAS.Schema.SchemaObject (Items (..), Schema (..), SchemaType (..), emptySchema)
import Text.Casing

data OASType
  = OASPrim OASPrimTy
  | OASArray OASType
  | OASObject Record
  | OASMaybe OASType
  | OASEnum Text [OASType]
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

fromRefRecSchemaT :: (Monad m) => Map Text (OrRef a) -> OrRef a -> SchemaT m a
fromRefRecSchemaT env orRef = liftEither $ flip first (fromRefRec env orRef) \case
  MissingRef r -> DanglingReference r
  RefCycleDetected path -> ReferenceCycle path

fromRefSchemaT :: (Monad m) => Map Text a -> OrRef a -> SchemaT m a
fromRefSchemaT env = liftEither . first DanglingReference . fromRef env

fromOrRefSchema :: (Monad m) => Map Text Schema -> Maybe Text -> OrRef Schema -> SchemaT m SchemaResult
fromOrRefSchema env mt = fromSchema env mt <=< fromRefSchemaT env

data SchemaResult = Type OASType | EmptySchema
  deriving (Eq, Ord, Show)

newtype TypeInfo = TypeInfo
  { types :: Set OASType
  }
  deriving (Show, Eq)

emptyTypeGraph :: TypeInfo
emptyTypeGraph = TypeInfo S.empty

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
  deriving newtype (Functor, Applicative, Monad, MonadError SchemaError, MonadState TypeInfo)

runSchemaT :: (Monad m) => SchemaT m a -> TypeInfo -> m (Either SchemaError a, TypeInfo)
runSchemaT schemaT = runStateT (runExceptT schemaT.action)

fromSchema :: (Monad m) => Map Text Schema -> Maybe Text -> Schema -> SchemaT m SchemaResult
fromSchema env mt s =
  if s == emptySchema
    then pure EmptySchema
    else case s.schemaType of
      -- Prim types, which don't get inserted into the type graph because we don't have to track them
      -- for library imports
      Just SchemaString -> pure . Type . OASPrim $ PrimString
      Just SchemaNumber -> pure . Type . OASPrim $ PrimFloat
      Just SchemaInteger -> pure . Type . OASPrim $ PrimInt
      Just SchemaBoolean -> pure . Type . OASPrim $ PrimBool
      Just SchemaNull -> pure EmptySchema
      -- Prim types, which don't get inserted into the type graph because we don't have to track them
      -- for library imports
      Nothing -> case s.anyOf of
        Nothing -> liftEither . Left $ MissingTypeField s mt
        Just anys -> do
          prefix <- liftEither $ maybe (Left $ MissingEnumPrefix s) Right $ s.title <|> mt
          tys <- for (NE.toList anys) (fromRefSchemaT env >=> \s' -> fromSchema env (s'.title <|> mt) s')
          let
            enum = OASEnum prefix (filterEmpty tys)
          modify \tyGraph ->
            tyGraph
              { types = S.insert enum tyGraph.types
              }
          pure . Type $ enum
      Just SchemaArray -> do
        is <- liftEither $ maybe (Left $ EmptyArray s) Right s.items
        mkArray (s.title <|> mt) is
      Just SchemaObject -> do
        ctr <- liftEither $ maybe (Left $ MissingRecordConstructor s) Right $ s.title <|> mt
        when (s.properties == M.empty) $
          liftEither . Left $
            MissingRecordFields s

        fields <- for (M.toList s.properties) \(label, orRef) ->
          let
            key = Key label (T.pack . toCamel . fromAny $ T.unpack label)
          in
            (key,) <$> fromOrRefSchema env (s.title <|> mt) orRef

        let
          obj =
            OASObject $
              Record
                (T.pack . toPascal . fromAny $ T.unpack ctr)
                (filterEmptySchema $ M.fromList fields)

        modify \tyInfo ->
          tyInfo
            { types = S.insert obj tyInfo.types
            }
        pure . Type $ obj
 where
  mkArray :: (Monad m) => Maybe Text -> Items -> SchemaT m SchemaResult
  mkArray mt' = \case
    ItemObject orRef -> do
      sr <- fromOrRefSchema env mt' orRef
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
      tys <- for ss (fromRefSchemaT env >=> \s' -> fromSchema env (s'.title <|> mt') s')
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

  go :: SchemaResult -> [OASType] -> [OASType]
  go EmptySchema acc = acc
  go (Type oasTy) acc = oasTy : acc

filterEmptySchema :: Map a SchemaResult -> Map a OASType
filterEmptySchema = M.mapMaybe go'
 where
  go' :: SchemaResult -> Maybe OASType
  go' EmptySchema = Nothing
  go' (Type oasTy) = Just oasTy
