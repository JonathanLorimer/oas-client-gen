{-# LANGUAGE StrictData #-}

module OAS.Schema.Link where

import Data.Aeson
import Data.Aeson.Types (Value)
import Data.Map.Strict (Map)
import Data.Map.Strict qualified as M
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
  deriving (Eq, Show)

data OperationIdentifier
  = OperationRef Text
  | OperationId Text
  deriving (Eq, Show)

instance FromJSON Link where
  parseJSON = withObject "Link" $ \o -> do
    opRef <- o .:? "operationRef"
    opId <- o .:? "operationId"
    identifier <- case (opRef, opId) of
      (Just ref, _) -> pure $ OperationRef ref
      (_, Just id) -> pure $ OperationId id
      _ -> fail "Either operationRef or operationId must be provided"

    parameters <- o .:? "parameters" .!= M.empty
    requestBody <- o .:? "requestBody"
    description <- o .:? "description"
    server <- o .:? "server"

    pure $ Link{..}

instance ToJSON Link where
  toJSON (Link ident params reqBody desc srv) =
    object $
      [ case ident of
          OperationRef ref -> "operationRef" .= ref
          OperationId opId -> "operationId" .= opId
      , "parameters" .= params
      , "requestBody" .= reqBody
      , "description" .= desc
      , "server" .= srv
      ]
