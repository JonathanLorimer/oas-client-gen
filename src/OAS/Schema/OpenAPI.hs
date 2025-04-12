{-# LANGUAGE StrictData #-}

module OAS.Schema.OpenAPI where

import Data.Map.Strict (Map)
import Data.Text (Text)
import Deriving.Aeson
import OAS.Schema.Component (ComponentObject)
import OAS.Schema.Info (Info)
import OAS.Schema.Path (Path, Paths)
import OAS.Schema.Server (Server)
import OAS.Schema.Tag (Tag)

-- | This is the root object of the [OpenAPI Description](https://swagger.io/specification/#openapi-description).
data OpenAPISpec = OpenAPISpec
  { openapi :: Text
  , info :: Info
  , jsonSchemaDialect :: Maybe Text
  , servers :: Maybe [Server]
  , paths :: Maybe Paths
  , webhooks :: Maybe Paths
  , components :: ComponentObject
  , tags :: Maybe [Tag]
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] OpenAPISpec
