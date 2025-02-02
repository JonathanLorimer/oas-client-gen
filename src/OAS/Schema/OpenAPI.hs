module OAS.Schema.OpenAPI where

import Data.Text (Text)
import OAS.Schema.Info (Info)

-- | This is the root object of the [OpenAPI Description](https://swagger.io/specification/#openapi-description).
data OpenAPISpec = OpenAPISpec
  { openapi :: Text
  , info :: Info
  , jsonSchemaDialect :: Maybe Text
  , servers :: Maybe [Server]
  }
