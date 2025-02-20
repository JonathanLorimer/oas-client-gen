{-# LANGUAGE StrictData #-}

module OAS.Schema.SchemaObject where

import Data.Aeson.Types (Value)
import Data.List.NonEmpty (NonEmpty)
import Data.Map.Strict (Map)
import Data.Scientific
import Data.Text (Text)
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
  -- ^ Names of fields on an object that are required
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

data Items = ItemObject (OrRef Schema) | ItemArray [OrRef Schema]

data SchemaType
  = SchemaString
  | SchemaNumber
  | SchemaInteger
  | SchemaBoolean
  | SchemaArray
  | SchemaNull
  | SchemaObject

data Discriminator = Discriminator
  { propertyName :: Text
  , mapping :: Map Text Text
  }

data XMLObject = XMLObject
  { name :: Maybe Text
  , namespace :: Maybe Text
  , prefix :: Maybe Text
  , attribute :: Bool
  , wrapped :: Bool
  }

data AdditionalProperties
  = Allowed Bool
  | AdditionalSchema (OrRef Schema)
