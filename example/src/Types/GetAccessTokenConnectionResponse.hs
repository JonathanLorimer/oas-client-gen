{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.GetAccessTokenConnectionResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Connection1 (Connection1)

data GetAccessTokenConnectionResponse = GetAccessTokenConnectionResponse
  { connection :: Connection1
  }
  deriving (Show, Eq)

instance FromJSON GetAccessTokenConnectionResponse where
  parseJSON = withObject "GetAccessTokenConnectionResponse" $ \obj -> do
    connection <- obj .: "connection"
    pure $ GetAccessTokenConnectionResponse{..}

instance ToJSON GetAccessTokenConnectionResponse where
  toJSON GetAccessTokenConnectionResponse{..} =
    object [
      "connection" .= connection
    ]
