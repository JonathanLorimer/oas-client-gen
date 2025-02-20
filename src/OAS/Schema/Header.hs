{-# LANGUAGE StrictData #-}

module OAS.Schema.Header where

import Data.Map.Strict (Map)
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

data HeaderSchema = HeaderSchema
  { style :: Maybe String
  , explode :: Bool
  , schema :: OrRef Schema
  , examples :: Map Text (OrRef Example)
  }

newtype HeaderContent = HeaderContent {content :: Map Text MediaType}

data MediaType = MediaType
  { schema :: Maybe Schema
  , examples :: Map Text (OrRef Example)
  , encoding :: Map Text Encoding
  }

data Encoding = Encoding
  { contentType :: [Text]
  , headers :: Map Text Header
  }
