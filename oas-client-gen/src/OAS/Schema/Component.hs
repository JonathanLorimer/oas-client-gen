{-# LANGUAGE StrictData #-}

module OAS.Schema.Component where

import Data.Aeson
import Data.Map.Strict (Map)
import Data.Maybe (catMaybes)
import Data.Text (Text)
import OAS.Schema.Example (Example)
import OAS.Schema.ExternalDocs (ExternalDocs)
import OAS.Schema.Header (Header)
import OAS.Schema.Link (Link)
import OAS.Schema.Parameter (Parameter)
import OAS.Schema.Path (Callback, Path)
import OAS.Schema.Ref (OrRef)
import OAS.Schema.RequestBody (RequestBody)
import OAS.Schema.Response (Response)
import OAS.Schema.SchemaObject (Schema)
import OAS.Schema.SecurityScheme (SecurityScheme)

data ComponentObject = ComponentObject
  { schemas :: Maybe (Map Text Schema)
  , responses :: Maybe (Map Text (OrRef Response))
  , parameters :: Maybe (Map Text (OrRef Parameter))
  , examples :: Maybe (Map Text (OrRef Example))
  , requestBodies :: Maybe (Map Text (OrRef RequestBody))
  , headers :: Maybe (Map Text (OrRef Header))
  , securitySchemes :: Maybe (Map Text (OrRef SecurityScheme))
  , links :: Maybe (Map Text (OrRef Link))
  , callbacks :: Maybe (Map Text (OrRef Callback))
  , pathItems :: Maybe (Map Text Path)
  , externalDocs :: Maybe ExternalDocs
  }
  deriving (Show, Eq)

instance FromJSON ComponentObject where
  parseJSON = withObject "ComponentObject" \o ->
    ComponentObject
      <$> o .:? "schemas"
      <*> o .:? "responses"
      <*> o .:? "parameters"
      <*> o .:? "examples"
      <*> o .:? "requestBodies"
      <*> o .:? "headers"
      <*> o .:? "securitySchemes"
      <*> o .:? "links"
      <*> o .:? "callbacks"
      <*> o .:? "pathItems"
      <*> o .:? "externalDocs"

instance ToJSON ComponentObject where
  toJSON ComponentObject{..} = object $ catMaybes
    [ ("schemas" .=) <$> schemas
    , ("responses" .=) <$> responses
    , ("parameters" .=) <$> parameters
    , ("examples" .=) <$> examples
    , ("requestBodies" .=) <$> requestBodies
    , ("headers" .=) <$> headers
    , ("securitySchemes" .=) <$> securitySchemes
    , ("links" .=) <$> links
    , ("callbacks" .=) <$> callbacks
    , ("pathItems" .=) <$> pathItems
    , ("externalDocs" .=) <$> externalDocs
    ]
