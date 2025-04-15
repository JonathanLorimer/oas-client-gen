module OAS.Generator.OASType where

import Control.Applicative ((<|>))
import Control.Monad
import Data.List.NonEmpty qualified as NE
import Data.Map (Map)
import Data.Map.Lazy qualified as M
import Data.Text (Text)
import Data.Text qualified as T
import Data.Traversable (for)
import OAS.Schema.Ref (OrRef (..), Ref (..))
import OAS.Schema.SchemaObject (Items (..), Schema (..), SchemaType (..))
import Text.Casing

data OASType
  = OASString
  | OASInt
  | OASFloat
  | OASArray OASType
  | OASObject Record
  | OASMaybe OASType
  | OASEnum Text [OASType]
  deriving (Eq, Ord, Show)

data Key = Key {json :: Text, haskell :: Text}
  deriving (Eq, Ord, Show)

data Record = Record
  { constructor :: Text
  , fields :: [(Key, OASType)]
  }
  deriving (Eq, Ord, Show)

fromSchema :: Map Text Schema -> Maybe Text -> Schema -> Either Text OASType
fromSchema env mt s = case s.schemaType of
  Nothing -> case s.anyOf of
    Nothing -> Left "This schema does not represent a type; type field is missing"
    Just anys -> do
      prefix <- maybe (Left "Need some sort of title for constructor prefixes") Right $ mt <|> s.title
      tys <- for (NE.toList anys) (fromRef env >=> \s' -> fromSchema env (s'.title <|> mt) s')
      pure $ OASEnum prefix tys
  Just SchemaString -> Right OASString
  Just SchemaNumber -> Right OASFloat
  Just SchemaInteger -> Right OASInt
  Just SchemaArray -> do
    let
      errMsg = "Tried to construct array that didn't have any items"
    is <- maybe (Left errMsg) Right s.items
    mkArray (s.title <|> mt) is
  Just SchemaObject -> do
    let
      ctrErrMsg = "Need something to use as the record constructor"
    ctr <- maybe (Left ctrErrMsg) Right $ mt <|> s.title
    when (s.properties == M.empty) $
      Left "Schema of type object has no properties"

    fields <- for (M.toList s.properties) \(label, orRef) -> case orRef of
      ByReference r -> case M.lookup r.ref env of
        Nothing -> Left $ "Dangling reference: " <> T.pack (show r)
        Just s' -> (Key label (T.pack . toCamel . fromAny $ T.unpack label),) <$> fromSchema env mt s'
      Direct s' -> (Key label (T.pack . toCamel . fromAny $ T.unpack label),) <$> fromSchema env mt s'

    pure . OASObject $ Record (T.pack . toPascal . fromAny $ T.unpack ctr) fields
 where
  mkArray :: Maybe Text -> Items -> Either Text OASType
  mkArray mt' = \case
    ItemObject s -> fromRef env s >>= fromSchema env mt'
    ItemArray ss -> do
      prefix <- maybe (Left "Need some sort of title for constructor prefixes") Right mt
      when (null ss) $ Left "Cannot have an array with no types"
      tys <- for ss (fromRef env >=> \s' -> fromSchema env (s'.title <|> mt') s')
      pure $ OASEnum prefix tys

  fromRef :: Map Text Schema -> OrRef Schema -> Either Text Schema
  fromRef env = \case
    ByReference r -> case M.lookup r.ref env of
      Nothing -> Left $ "Dangling reference: " <> T.pack (show r)
      Just s -> pure s
    Direct s -> pure s
