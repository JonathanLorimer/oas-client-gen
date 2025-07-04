{-# LANGUAGE StrictData #-}

module OAS.Schema.Path where

import Data.Aeson
import Data.List.NonEmpty (NonEmpty)
import Data.Map.Strict (Map)
import Data.Text (Text)
import Deriving.Aeson
import OAS.Schema.ExternalDocs (ExternalDocs)
import OAS.Schema.Parameter (Parameter)
import OAS.Schema.Ref (OrRef)
import OAS.Schema.RequestBody (RequestBody)
import OAS.Schema.Response (Responses)
import OAS.Schema.RuntimeExpression (RuntimeExpression)
import OAS.Schema.Server (Server)

type Paths = Map Text (OrRef Path)

type Callback = Map RuntimeExpression (OrRef Path)

data Path = Path
  { get :: Maybe Operation
  , put :: Maybe Operation
  , post :: Maybe Operation
  , delete :: Maybe Operation
  , options :: Maybe Operation
  , trace :: Maybe Operation
  , servers :: Maybe [Server]
  , parameters :: Maybe [OrRef Parameter]
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] Path

data Operation = Operation
  { tags :: Maybe (NonEmpty Text)
  , summary :: Maybe Text
  , description :: Maybe Text
  , externalDocs :: Maybe ExternalDocs
  , operationId :: Maybe Text
  , parameters :: Maybe [OrRef Parameter]
  , requestBody :: Maybe (OrRef RequestBody)
  , responses :: Responses
  , callbacks :: Maybe (Map Text (OrRef Callback))
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] Operation
