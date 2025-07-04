{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ConnectionResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Connection2 (Connection2)

data ConnectionResponse = ConnectionResponse
  { connection :: Connection2
  }
  deriving (Show, Eq)

instance FromJSON ConnectionResponse where
  parseJSON = withObject "ConnectionResponse" $ \obj -> do
    connection <- obj .: "connection"
    pure $ ConnectionResponse{..}

instance ToJSON ConnectionResponse where
  toJSON ConnectionResponse{..} =
    object [
      "connection" .= connection
    ]
