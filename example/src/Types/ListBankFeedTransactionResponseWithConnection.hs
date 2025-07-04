{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListBankFeedTransactionResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.BankFeedTransaction (BankFeedTransaction)

data ListBankFeedTransactionResponseWithConnection = ListBankFeedTransactionResponseWithConnection
  { bankFeedTransactions :: [BankFeedTransaction]
  , connection :: Connection
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListBankFeedTransactionResponseWithConnection where
  parseJSON = withObject "ListBankFeedTransactionResponseWithConnection" $ \obj -> do
    bankFeedTransactions <- obj .: "bank_feed_transactions"
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    pure $ ListBankFeedTransactionResponseWithConnection{..}

instance ToJSON ListBankFeedTransactionResponseWithConnection where
  toJSON ListBankFeedTransactionResponseWithConnection{..} =
    object [
      "bank_feed_transactions" .= bankFeedTransactions,
      "connection" .= connection,
      "next_cursor" .= nextCursor
    ]
