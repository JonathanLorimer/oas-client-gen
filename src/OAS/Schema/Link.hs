{-# LANGUAGE StrictData #-}

module OAS.Schema.Link where

import Data.Aeson.Types (Value)
import Data.Map.Strict (Map)
import Data.Text (Text)
import OAS.Schema.RuntimeExpression (RuntimeExpression)
import OAS.Schema.Server (Server)

data Link = Link
  { identifier :: OperationIdentifier
  , parameters :: Map Text (Either Value RuntimeExpression)
  , requestBody :: Maybe (Either Value RuntimeExpression)
  , description :: Maybe Text
  , server :: Maybe Server
  }

data OperationIdentifier
  = OperationRef Text
  | OperationId Text
