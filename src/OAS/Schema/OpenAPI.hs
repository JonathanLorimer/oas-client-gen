{-# LANGUAGE StrictData #-}

module OAS.Schema.OpenAPI where

import Data.Map.Strict (Map)
import Data.Text (Text)
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
  , paths :: Paths
  , webhooks :: Paths
  , components :: ComponentObject
  , tags :: [Tag]
  }
