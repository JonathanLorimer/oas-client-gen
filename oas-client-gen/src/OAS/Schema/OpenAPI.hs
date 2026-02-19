{-# LANGUAGE StrictData #-}

module OAS.Schema.OpenAPI where

import Data.Aeson
import Data.Map.Strict (Map)
import Data.Maybe (catMaybes)
import Data.Text (Text)
import OAS.Schema.Component (ComponentObject)
import OAS.Schema.Info (Info)
import OAS.Schema.Path (Paths)
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
  , components :: Maybe ComponentObject
  , tags :: Maybe [Tag]
  }
  deriving (Show, Eq)

instance FromJSON OpenAPISpec where
  parseJSON = withObject "OpenAPISpec" \o ->
    OpenAPISpec
      <$> o .: "openapi"
      <*> o .: "info"
      <*> o .:? "jsonSchemaDialect"
      <*> o .:? "servers"
      <*> o .:? "paths"
      <*> o .:? "webhooks"
      <*> o .:? "components"
      <*> o .:? "tags"

instance ToJSON OpenAPISpec where
  toJSON OpenAPISpec{..} = object $ catMaybes
    [ Just $ "openapi" .= openapi
    , Just $ "info" .= info
    , ("jsonSchemaDialect" .=) <$> jsonSchemaDialect
    , ("servers" .=) <$> servers
    , ("paths" .=) <$> paths
    , ("webhooks" .=) <$> webhooks
    , ("components" .=) <$> components
    , ("tags" .=) <$> tags
    ]
