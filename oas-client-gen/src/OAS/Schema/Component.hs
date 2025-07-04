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
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] ComponentObject
