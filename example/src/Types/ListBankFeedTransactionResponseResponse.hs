{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListBankFeedTransactionResponseResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.BankFeedTransactionResponse (BankFeedTransactionResponse)

data ListBankFeedTransactionResponseResponse = ListBankFeedTransactionResponseResponse
  { bankFeedTransactions :: [BankFeedTransactionResponse]
  }
  deriving (Show, Eq)

instance FromJSON ListBankFeedTransactionResponseResponse where
  parseJSON = withObject "ListBankFeedTransactionResponseResponse" $ \obj -> do
    bankFeedTransactions <- obj .: "bank_feed_transactions"
    pure $ ListBankFeedTransactionResponseResponse{..}

instance ToJSON ListBankFeedTransactionResponseResponse where
  toJSON ListBankFeedTransactionResponseResponse{..} =
    object [
      "bank_feed_transactions" .= bankFeedTransactions
    ]
