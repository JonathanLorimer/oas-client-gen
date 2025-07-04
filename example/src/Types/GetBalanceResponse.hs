{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.GetBalanceResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Balance (Balance)
import Types.Balance (Balance)

data GetBalanceResponse = GetBalanceResponse
  { balance :: Balance
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON GetBalanceResponse where
  parseJSON = withObject "GetBalanceResponse" $ \obj -> do
    balance <- obj .: "balance"
    connection <- obj .: "connection"
    pure $ GetBalanceResponse{..}

instance ToJSON GetBalanceResponse where
  toJSON GetBalanceResponse{..} =
    object [
      "balance" .= balance,
      "connection" .= connection
    ]
