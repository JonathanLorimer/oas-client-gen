{-# LANGUAGE StrictData #-}

module OAS.Schema.Server where

import Data.Aeson
import Data.List.NonEmpty (NonEmpty)
import Data.Map.Strict (Map)
import Data.Maybe (catMaybes)
import Data.Text (Text)

-- | <https://swagger.io/specification/#server-object>
data Server = Server
  { url :: Text
  , description :: Maybe Text
  , variables :: Maybe (Map Text ServerVariable)
  }
  deriving (Show, Eq)

instance FromJSON Server where
  parseJSON = withObject "Server" \o ->
    Server
      <$> o .: "url"
      <*> o .:? "description"
      <*> o .:? "variables"

instance ToJSON Server where
  toJSON Server{..} = object $ catMaybes
    [ Just $ "url" .= url
    , ("description" .=) <$> description
    , ("variables" .=) <$> variables
    ]

data ServerVariable = ServerVariable
  { enum :: Maybe (NonEmpty Text)
  , def :: Text
  , description :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ServerVariable where
  parseJSON = withObject "ServerVariable" \o ->
    ServerVariable
      <$> o .:? "enum"
      <*> o .: "def"
      <*> o .:? "description"

instance ToJSON ServerVariable where
  toJSON ServerVariable{..} = object $ catMaybes
    [ ("enum" .=) <$> enum
    , Just $ "def" .= def
    , ("description" .=) <$> description
    ]
