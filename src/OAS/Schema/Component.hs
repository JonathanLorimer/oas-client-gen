{-# LANGUAGE StrictData #-}

module OAS.Schema.Component where

import Data.Map.Strict (Map)
import Data.Text (Text)
import Deriving.Aeson
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
  { schemas :: Map Text Schema
  , responses :: Map Text (OrRef Response)
  , parameters :: Map Text (OrRef Parameter)
  , examples :: Map Text (OrRef Example)
  , requestBodies :: Map Text (OrRef RequestBody)
  , headers :: Map Text (OrRef Header)
  , securitySchemes :: Map Text (OrRef SecurityScheme)
  , links :: Map Text (OrRef Link)
  , callbacks :: Map Text (OrRef Callback)
  , pathItems :: Map Text Path
  , externalDocs :: ExternalDocs
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] ComponentObject
