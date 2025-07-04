{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankFeedTransactionResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BankFeedTransactionResponseWithConnection = BankFeedTransactionResponseWithConnection
  { bankFeedTransaction :: BankFeedTransaction
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON BankFeedTransactionResponseWithConnection where
  parseJSON = withObject "BankFeedTransactionResponseWithConnection" $ \obj -> do
    bankFeedTransaction <- obj .: "bank_feed_transaction"
    connection <- obj .: "connection"
    pure $ BankFeedTransactionResponseWithConnection{..}

instance ToJSON BankFeedTransactionResponseWithConnection where
  toJSON BankFeedTransactionResponseWithConnection{..} =
    object [
      "bank_feed_transaction" .= bankFeedTransaction,
      "connection" .= connection
    ]
