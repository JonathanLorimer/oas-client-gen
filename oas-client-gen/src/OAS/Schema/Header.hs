{-# LANGUAGE StrictData #-}

module OAS.Schema.Header where

import Data.Aeson hiding (Encoding)
import Data.Map.Strict (Map)
import Data.Maybe (catMaybes)
import Data.Text (Text)
import OAS.Schema.Example (Example)
import OAS.Schema.Ref (OrRef)
import OAS.Schema.SchemaObject (Schema)

data Header = Header
  { description :: Text
  , required :: Bool
  , deprecated :: Bool
  , schemaOrContent :: Either HeaderSchema HeaderContent
  }
  deriving (Show, Eq)

instance FromJSON Header where
  parseJSON = withObject "Header" \o ->
    Header
      <$> o .: "description"
      <*> o .: "required"
      <*> o .: "deprecated"
      <*> o .: "schemaOrContent"

instance ToJSON Header where
  toJSON Header{..} = object
    [ "description" .= description
    , "required" .= required
    , "deprecated" .= deprecated
    , "schemaOrContent" .= schemaOrContent
    ]

data HeaderSchema = HeaderSchema
  { style :: Maybe String
  , explode :: Bool
  , schema :: OrRef Schema
  , examples :: Map Text (OrRef Example)
  }
  deriving (Show, Eq)

instance FromJSON HeaderSchema where
  parseJSON = withObject "HeaderSchema" \o ->
    HeaderSchema
      <$> o .:? "style"
      <*> o .: "explode"
      <*> o .: "schema"
      <*> o .: "examples"

instance ToJSON HeaderSchema where
  toJSON HeaderSchema{..} = object $ catMaybes
    [ ("style" .=) <$> style
    , Just $ "explode" .= explode
    , Just $ "schema" .= schema
    , Just $ "examples" .= examples
    ]

newtype HeaderContent = HeaderContent {content :: Map Text MediaType}
  deriving (Show, Eq)

instance FromJSON HeaderContent where
  parseJSON = withObject "HeaderContent" \o ->
    HeaderContent
      <$> o .: "content"

instance ToJSON HeaderContent where
  toJSON HeaderContent{..} = object
    [ "content" .= content
    ]

data MediaType = MediaType
  { schema :: Maybe (OrRef Schema)
  , examples :: Maybe (Map Text (OrRef Example))
  , encoding :: Maybe (Map Text Encoding)
  }
  deriving (Show, Eq)

instance FromJSON MediaType where
  parseJSON = withObject "MediaType" \o ->
    MediaType
      <$> o .:? "schema"
      <*> o .:? "examples"
      <*> o .:? "encoding"

instance ToJSON MediaType where
  toJSON MediaType{..} = object $ catMaybes
    [ ("schema" .=) <$> schema
    , ("examples" .=) <$> examples
    , ("encoding" .=) <$> encoding
    ]

data Encoding = Encoding
  { contentType :: [Text]
  , headers :: Map Text Header
  }
  deriving (Show, Eq)

instance FromJSON Encoding where
  parseJSON = withObject "Encoding" \o ->
    Encoding
      <$> o .: "contentType"
      <*> o .: "headers"

instance ToJSON Encoding where
  toJSON Encoding{..} = object
    [ "contentType" .= contentType
    , "headers" .= headers
    ]
