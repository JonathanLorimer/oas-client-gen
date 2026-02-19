{-# LANGUAGE StrictData #-}

module OAS.Schema.Parameter where

import Control.Applicative
import Data.Aeson
import Data.Aeson.Types (Value)
import Data.Map.Strict (Map)
import Data.Maybe (catMaybes)
import Data.Text (Text)
import OAS.Schema.Example (Example)
import OAS.Schema.Header (MediaType)
import OAS.Schema.Ref (OrRef, Ref)
import OAS.Schema.SchemaObject (Schema)

data Location = Query | Header | Path | Cookie
  deriving (Show, Eq)

instance FromJSON Location where
  parseJSON = withText "Location" \case
    "query" -> pure Query
    "header" -> pure Header
    "path" -> pure Path
    "cookie" -> pure Cookie
    t -> fail $ "Unknown Location: " <> show t

instance ToJSON Location where
  toJSON = \case
    Query -> "query"
    Header -> "header"
    Path -> "path"
    Cookie -> "cookie"

data Parameter = Parameter
  { name :: Text
  , parameterIn :: Location
  , description :: Maybe Text
  , required :: Maybe Bool
  , deprecated :: Maybe Bool
  , allowEmptyValue :: Maybe Bool
  , serialization :: Maybe Serialization
  }
  deriving (Show, Eq)

instance FromJSON Parameter where
  parseJSON = withObject "Parameter" \o ->
    Parameter
      <$> o .: "name"
      <*> o .: "in"
      <*> o .:? "description"
      <*> o .:? "required"
      <*> o .:? "deprecated"
      <*> o .:? "allowEmptyValue"
      <*> o .:? "serialization"

instance ToJSON Parameter where
  toJSON Parameter{..} = object $ catMaybes
    [ Just $ "name" .= name
    , Just $ "in" .= parameterIn
    , ("description" .=) <$> description
    , ("required" .=) <$> required
    , ("deprecated" .=) <$> deprecated
    , ("allowEmptyValue" .=) <$> allowEmptyValue
    , ("serialization" .=) <$> serialization
    ]

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
  deriving (Show, Eq)

instance FromJSON SerializationStyle where
  parseJSON = withText "SerializationStyle" \case
    "form" -> pure Form
    "simple" -> pure Simple
    "matrix" -> pure Matrix
    "label" -> pure Label
    "spacedelimited" -> pure SpaceDelimited
    "pipedelimited" -> pure PipeDelimited
    "deepobject" -> pure DeepObject
    t -> fail $ "Unknown SerializationStyle: " <> show t

instance ToJSON SerializationStyle where
  toJSON = \case
    Form -> "form"
    Simple -> "simple"
    Matrix -> "matrix"
    Label -> "label"
    SpaceDelimited -> "spacedelimited"
    PipeDelimited -> "pipedelimited"
    DeepObject -> "deepobject"

data ParameterSchema = ParameterSchema
  { style :: Maybe SerializationStyle
  , explode :: Maybe Bool
  , allowReserved :: Maybe Bool
  , schema :: Maybe (OrRef Schema)
  , example :: Maybe Value
  , examples :: Maybe (Map Text (OrRef Example))
  }
  deriving (Show, Eq)

instance FromJSON ParameterSchema where
  parseJSON = withObject "ParameterSchema" \o ->
    ParameterSchema
      <$> o .:? "style"
      <*> o .:? "explode"
      <*> o .:? "allowReserved"
      <*> o .:? "schema"
      <*> o .:? "example"
      <*> o .:? "examples"

instance ToJSON ParameterSchema where
  toJSON ParameterSchema{..} = object $ catMaybes
    [ ("style" .=) <$> style
    , ("explode" .=) <$> explode
    , ("allowReserved" .=) <$> allowReserved
    , ("schema" .=) <$> schema
    , ("example" .=) <$> example
    , ("examples" .=) <$> examples
    ]

newtype ParameterContent = ParameterContent {content :: Map Text MediaType}
  deriving (Show, Eq)

instance FromJSON ParameterContent where
  parseJSON = withObject "ParameterContent" \o ->
    ParameterContent
      <$> o .: "content"

instance ToJSON ParameterContent where
  toJSON ParameterContent{..} = object
    [ "content" .= content
    ]
