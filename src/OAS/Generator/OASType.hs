module OAS.Generator.OASType where

import Control.Applicative ((<|>))
import Data.List.NonEmpty qualified as NE
import Data.Map (Map)
import Data.Map.Lazy qualified as M
import Data.Text (Text)
import Data.Text qualified as T
import Data.Traversable (for)
import OAS.Schema.Ref (OrRef (..), Ref (..))
import OAS.Schema.SchemaObject (Items, Schema (..), SchemaType (..))

data OASType
  = OASString
  | OASInt
  | OASFloat
  | OASArray OASType
  | OASObject Record
  | OASMaybe OASType
  | OASEnum (Maybe Text) [OASType]
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
    Just anys ->
      OASEnum mt <$> for (NE.toList anys) \case
        ByReference r -> case M.lookup r.ref env of
          Nothing -> Left $ "Dangling reference: " <> T.pack (show r)
          Just s -> fromSchema env (s.title <|> mt) s
        Direct s -> fromSchema env (s.title <|> mt) s
  Just SchemaString -> Right OASString
  Just SchemaNumber -> Right OASFloat
  Just SchemaInteger -> Right OASInt
  Just SchemaArray -> do
    let
      errMsg = "Tried to construct array that didn't have any items"
    is <- maybe (Left errMsg) Right s.items
    mkArray (s.title <|> mt) is
  Just SchemaObject -> undefined
 where
  mkArray :: Maybe Text -> Items -> Either Text OASType
  mkArray i = undefined
