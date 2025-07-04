{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.GetStoreResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Store (Store)

data GetStoreResponse = GetStoreResponse
  { connection :: Connection
  , store :: Store
  }
  deriving (Show, Eq)

instance FromJSON GetStoreResponse where
  parseJSON = withObject "GetStoreResponse" $ \obj -> do
    connection <- obj .: "connection"
    store <- obj .: "store"
    pure $ GetStoreResponse{..}

instance ToJSON GetStoreResponse where
  toJSON GetStoreResponse{..} =
    object [
      "connection" .= connection,
      "store" .= store
    ]
