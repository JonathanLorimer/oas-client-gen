{-# LANGUAGE StrictData #-}

module OAS.Schema.Parameter where

import Control.Applicative
import Data.Aeson
import Data.Aeson.Types (Value)
import Data.Map.Strict (Map)
import Data.Text (Text)
import Deriving.Aeson
import OAS.Aeson.Modifiers
import OAS.Schema.Example (Example)
import OAS.Schema.Header (MediaType)
import OAS.Schema.Ref (OrRef, Ref)
import OAS.Schema.SchemaObject (Schema)

data Location = Query | Header | Path | Cookie
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[ConstructorTagModifier '[ToLower]] Location

data Parameter = Parameter
  { name :: Text
  , parameterIn :: Location
  , description :: Text
  , required :: Bool
  , deprecated :: Bool
  , allowEmptyValue :: Bool
  , serialization :: Serialization
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[FieldLabelModifier '[CamelToSnake, Rename "parameterIn" "in"]] Parameter

data Serialization
  = Content ParameterContent
  | Schema ParameterSchema
  deriving (Show, Eq)

instance FromJSON Serialization where
  parseJSON v = (Schema <$> parseJSON v) <|> (Content <$> parseJSON v)

instance ToJSON Serialization where
  toJSON (Content c) = toJSON c
  toJSON (Schema s) = toJSON s

data SerializationStyle
  = Form
  | Simple
  | Matrix
  | Label
  | SpaceDelimited
  | PipeDelimited
  | DeepObject
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[ConstructorTagModifier '[ToLower]] SerializationStyle

data ParameterSchema = ParameterSchema
  { style :: SerializationStyle
  , explode :: Bool
  , allowReserved :: Bool
  , schema :: Schema
  , example :: Value
  , examples :: Map Text (OrRef Example)
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[] ParameterSchema

newtype ParameterContent = ParameterContent {content :: Map Text MediaType}
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[] ParameterContent
