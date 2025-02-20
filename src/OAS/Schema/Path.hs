{-# LANGUAGE StrictData #-}

module OAS.Schema.Path where

import Data.List.NonEmpty (NonEmpty)
import Data.Map.Strict (Map)
import Data.Text (Text)
import OAS.Schema.ExternalDocs (ExternalDocs)
import OAS.Schema.Parameter (Parameter)
import OAS.Schema.Ref (OrRef)
import OAS.Schema.RequestBody (RequestBody)
import OAS.Schema.Response (Responses)
import OAS.Schema.RuntimeExpression (RuntimeExpression)
import OAS.Schema.Server (Server)

type Paths = Map Text Path

type Callback = Map RuntimeExpression Path

data Path = Path
  { ref :: Maybe Text
  , summary :: Maybe Text
  , description :: Maybe Text
  , get :: Maybe Operation
  , put :: Maybe Operation
  , post :: Maybe Operation
  , delete :: Maybe Operation
  , options :: Maybe Operation
  , trace :: Maybe Operation
  , servers :: [Server]
  , parameters :: OrRef Parameter
  }

data Operation = Operation
  { tags :: [Text]
  , summary :: Maybe Text
  , description :: Maybe Text
  , externalDocs :: Maybe ExternalDocs
  , operationId :: Maybe Text
  , parameters :: Maybe (OrRef Parameter)
  , requestBody :: Maybe (OrRef RequestBody)
  , responses :: Responses
  , callbacks :: Map Text (OrRef Callback)
  }
