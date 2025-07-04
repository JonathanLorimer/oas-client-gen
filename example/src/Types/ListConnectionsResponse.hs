{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListConnectionsResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Connections (Connections)

data ListConnectionsResponse = ListConnectionsResponse
  { connections :: [Connections]
  }
  deriving (Show, Eq)

instance FromJSON ListConnectionsResponse where
  parseJSON = withObject "ListConnectionsResponse" $ \obj -> do
    connections <- obj .: "connections"
    pure $ ListConnectionsResponse{..}

instance ToJSON ListConnectionsResponse where
  toJSON ListConnectionsResponse{..} =
    object [
      "connections" .= connections
    ]
