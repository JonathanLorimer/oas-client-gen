{-# LANGUAGE StrictData #-}

module OAS.Schema.Header where

import Data.Map.Strict (Map)
import Data.Text (Text)
import Deriving.Aeson
import OAS.Schema.Example (Example)
import OAS.Schema.Ref (OrRef)
import OAS.Schema.SchemaObject (Schema)

data Header = Header
  { description :: Text
  , required :: Bool
  , deprecated :: Bool
  , schemaOrContent :: Either HeaderSchema HeaderContent
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] Header

data HeaderSchema = HeaderSchema
  { style :: Maybe String
  , explode :: Bool
  , schema :: OrRef Schema
  , examples :: Map Text (OrRef Example)
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] HeaderSchema

newtype HeaderContent = HeaderContent {content :: Map Text MediaType}
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] HeaderContent

data MediaType = MediaType
  { schema :: Maybe (OrRef Schema)
  , examples :: Maybe (Map Text (OrRef Example))
  , encoding :: Maybe (Map Text Encoding)
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] MediaType

data Encoding = Encoding
  { contentType :: [Text]
  , headers :: Map Text Header
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] Encoding
