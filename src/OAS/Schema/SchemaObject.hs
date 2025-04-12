{-# LANGUAGE StrictData #-}

module OAS.Schema.SchemaObject where

import Data.Aeson
import Data.List.NonEmpty (NonEmpty)
import Data.Map.Strict (Map)
import Data.Scientific
import Data.Text (Text)
import Deriving.Aeson
import OAS.Aeson.Modifiers
import OAS.Schema.Example (Example)
import OAS.Schema.ExternalDocs (ExternalDocs)
import OAS.Schema.Ref (OrRef)

data Schema = Schema
  { discriminator :: Maybe Discriminator
  , xml :: Maybe XMLObject
  , externalDocs :: Maybe ExternalDocs
  , example :: Maybe Value
  , examples :: [Example]
  , title :: Maybe Text
  , description :: Maybe Text
  , required :: [Text]
  , nullable :: Maybe Bool
  , allOf :: Maybe (NonEmpty (OrRef Schema))
  , oneOf :: Maybe (NonEmpty (OrRef Schema))
  , anyOf :: Maybe (NonEmpty (OrRef Schema))
  , not :: Maybe (OrRef Schema)
  , properties :: Map Text (OrRef Schema)
  , additionalProperties :: Maybe AdditionalProperties
  , readOnly :: Maybe Bool
  , writeOnly :: Maybe Bool
  , deprecated :: Maybe Bool
  , maxProperties :: Maybe Integer
  , minProperties :: Maybe Integer
  , def :: Maybe Value
  , schemaType :: Maybe SchemaType
  , format :: Maybe Text
  , items :: Maybe Items
  , maximum :: Maybe Scientific
  , exclusiveMaximum :: Maybe Bool
  , minimum :: Maybe Scientific
  , exclusiveMinimum :: Maybe Bool
  , maxLength :: Maybe Integer
  , minLength :: Maybe Integer
  , pattern :: Maybe Text
  , maxItems :: Maybe Integer
  , minItems :: Maybe Integer
  , uniqueItems :: Maybe Bool
  , enum :: Maybe [Value]
  , multipleOf :: Maybe Scientific
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] Schema

data Items = ItemObject (OrRef Schema) | ItemArray [OrRef Schema]
  deriving (Show, Eq)

instance FromJSON Items where
  parseJSON v@(Array _) = ItemArray <$> parseJSON v
  parseJSON v = ItemObject <$> parseJSON v

-- Custom ToJSON instance
instance ToJSON Items where
  toJSON = \case
    ItemObject schema -> toJSON schema
    ItemArray schemas -> toJSON schemas

data SchemaType
  = SchemaString
  | SchemaNumber
  | SchemaInteger
  | SchemaBoolean
  | SchemaArray
  | SchemaNull
  | SchemaObject
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[ConstructorTagModifier '[StripPrefix "Schema", ToLower]] SchemaType

data Discriminator = Discriminator
  { propertyName :: Text
  , mapping :: Map Text Text
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] Discriminator

data XMLObject = XMLObject
  { name :: Maybe Text
  , namespace :: Maybe Text
  , prefix :: Maybe Text
  , attribute :: Bool
  , wrapped :: Bool
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] XMLObject

data AdditionalProperties
  = Allowed Bool
  | AdditionalSchema (OrRef Schema)
  deriving (Show, Eq, Generic)

instance FromJSON AdditionalProperties where
  parseJSON v@(Bool b) = pure $ Allowed b
  parseJSON v = AdditionalSchema <$> parseJSON v

instance ToJSON AdditionalProperties where
  toJSON (Allowed b) = toJSON b
  toJSON (AdditionalSchema schema) = toJSON schema
