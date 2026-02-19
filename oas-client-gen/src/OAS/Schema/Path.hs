{-# LANGUAGE StrictData #-}

module OAS.Schema.Path where

import Data.Aeson
import Data.List.NonEmpty (NonEmpty)
import Data.Map.Strict (Map)
import Data.Maybe (catMaybes)
import Data.Text (Text)
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
  deriving (Show, Eq)

instance FromJSON Path where
  parseJSON = withObject "Path" \o ->
    Path
      <$> o .:? "get"
      <*> o .:? "put"
      <*> o .:? "post"
      <*> o .:? "delete"
      <*> o .:? "options"
      <*> o .:? "trace"
      <*> o .:? "servers"
      <*> o .:? "parameters"

instance ToJSON Path where
  toJSON Path{..} = object $ catMaybes
    [ ("get" .=) <$> get
    , ("put" .=) <$> put
    , ("post" .=) <$> post
    , ("delete" .=) <$> delete
    , ("options" .=) <$> options
    , ("trace" .=) <$> trace
    , ("servers" .=) <$> servers
    , ("parameters" .=) <$> parameters
    ]

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
  deriving (Show, Eq)

instance FromJSON Operation where
  parseJSON = withObject "Operation" \o ->
    Operation
      <$> o .:? "tags"
      <*> o .:? "summary"
      <*> o .:? "description"
      <*> o .:? "externalDocs"
      <*> o .:? "operationId"
      <*> o .:? "parameters"
      <*> o .:? "requestBody"
      <*> o .: "responses"
      <*> o .:? "callbacks"

instance ToJSON Operation where
  toJSON Operation{..} = object $ catMaybes
    [ ("tags" .=) <$> tags
    , ("summary" .=) <$> summary
    , ("description" .=) <$> description
    , ("externalDocs" .=) <$> externalDocs
    , ("operationId" .=) <$> operationId
    , ("parameters" .=) <$> parameters
    , ("requestBody" .=) <$> requestBody
    , Just $ "responses" .= responses
    , ("callbacks" .=) <$> callbacks
    ]
