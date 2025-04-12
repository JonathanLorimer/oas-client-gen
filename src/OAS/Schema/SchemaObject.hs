{-# LANGUAGE StrictData #-}

module OAS.Schema.SchemaObject where

import Data.Aeson
import Data.List.NonEmpty (NonEmpty)
import Data.Map.Strict (Map)
import Data.Map.Strict qualified as M
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
  deriving (Show, Eq)

instance FromJSON Schema where
  parseJSON = withObject "Schema" $ \o -> do
    discriminator <- o .:? "discriminator"
    xml <- o .:? "xml"
    externalDocs <- o .:? "externalDocs"
    example <- o .:? "example"
    examples <- o .:? "examples" .!= []
    title <- o .:? "title"
    description <- o .:? "description"
    required <- o .:? "required" .!= []
    nullable <- o .:? "nullable"
    allOf <- o .:? "allOf"
    oneOf <- o .:? "oneOf"
    anyOf <- o .:? "anyOf"
    not <- o .:? "not"
    properties <- o .:? "properties" .!= M.empty
    additionalProperties <- o .:? "additionalProperties"
    readOnly <- o .:? "readOnly"
    writeOnly <- o .:? "writeOnly"
    deprecated <- o .:? "deprecated"
    maxProperties <- o .:? "maxProperties"
    minProperties <- o .:? "minProperties"
    def <- o .:? "default" -- "def" maps to "default" in JSON
    schemaType <- o .:? "type"
    format <- o .:? "format"
    items <- o .:? "items"
    maximum <- o .:? "maximum"
    exclusiveMaximum <- o .:? "exclusiveMaximum"
    minimum <- o .:? "minimum"
    exclusiveMinimum <- o .:? "exclusiveMinimum"
    maxLength <- o .:? "maxLength"
    minLength <- o .:? "minLength"
    pattern <- o .:? "pattern"
    maxItems <- o .:? "maxItems"
    minItems <- o .:? "minItems"
    uniqueItems <- o .:? "uniqueItems"
    enum <- o .:? "enum"
    multipleOf <- o .:? "multipleOf"

    pure Schema{..}

instance ToJSON Schema where
  toJSON Schema{not = not', ..} =
    object $
      filter
        notNull
        [ "discriminator" .= discriminator
        , "xml" .= xml
        , "externalDocs" .= externalDocs
        , "example" .= example
        , "examples" .= (if null examples then Nothing else Just examples)
        , "title" .= title
        , "description" .= description
        , "required" .= (if null required then Nothing else Just required)
        , "nullable" .= nullable
        , "allOf" .= allOf
        , "oneOf" .= oneOf
        , "anyOf" .= anyOf
        , "not" .= not'
        , "properties" .= (if M.null properties then Nothing else Just properties)
        , "additionalProperties" .= additionalProperties
        , "readOnly" .= readOnly
        , "writeOnly" .= writeOnly
        , "deprecated" .= deprecated
        , "maxProperties" .= maxProperties
        , "minProperties" .= minProperties
        , "default" .= def -- "def" in Haskell maps to "default" in JSON
        , "type" .= schemaType
        , "format" .= format
        , "items" .= items
        , "maximum" .= maximum
        , "exclusiveMaximum" .= exclusiveMaximum
        , "minimum" .= minimum
        , "exclusiveMinimum" .= exclusiveMinimum
        , "maxLength" .= maxLength
        , "minLength" .= minLength
        , "pattern" .= pattern
        , "maxItems" .= maxItems
        , "minItems" .= minItems
        , "uniqueItems" .= uniqueItems
        , "enum" .= enum
        , "multipleOf" .= multipleOf
        ]
   where
    notNull (_, Null) = False
    notNull (_, Array a) = not (null a)
    notNull (_, Object o) = not (null o)
    notNull _ = True

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
    via CustomJSON '[] Discriminator

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
