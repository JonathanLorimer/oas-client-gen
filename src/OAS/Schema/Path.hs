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
  deriving (Eq, Show)

instance FromJSON Path where
  parseJSON = withObject "Path" $ \o -> do
    ref <- o .:? "$ref"
    summary <- o .:? "summary"
    description <- o .:? "description"
    get <- o .:? "get"
    put <- o .:? "put"
    post <- o .:? "post"
    delete <- o .:? "delete"
    options <- o .:? "options"
    trace <- o .:? "trace"
    servers <- o .:? "servers" .!= []
    parameters <- o .: "parameters"

    pure $ Path{..}

instance ToJSON Path where
  toJSON Path{..} =
    object $
      filter
        notNull
        [ "$ref" .= ref
        , "summary" .= summary
        , "description" .= description
        , "get" .= get
        , "put" .= put
        , "post" .= post
        , "delete" .= delete
        , "options" .= options
        , "trace" .= trace
        , "servers" .= servers
        , "parameters" .= parameters
        ]
   where
    notNull (_, Null) = False
    notNull (_, Array a) = not (null a)
    notNull _ = True

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
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] Operation
