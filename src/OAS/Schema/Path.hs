{-# LANGUAGE StrictData #-}

module OAS.Schema.Path where

import Data.List.NonEmpty (NonEmpty)
import Data.Map.Strict (Map)
import Data.Text (Text)
import OAS.Schema.Ref (OrRef)
import OAS.Schema.Response (Response, ResponseType)
import OAS.Schema.RuntimeExpression (RuntimeExpression)
import OAS.Schema.Server (Server)

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
  , operationId :: Text
  , parameters :: OrRef Parameter
  , requestBody :: OrRef RequestBody
  , responses :: Map ResponseType (OrRef Response)
  , callbacks :: Map Text (OrRef (Map RuntimeExpression Path))
  }

data ExternalDocs = ExternalDocs
  { description :: Maybe Text
  , url :: Text
  }
