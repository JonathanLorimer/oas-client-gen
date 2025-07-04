{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateBankFeedTransactionsRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.CreateBankFeedTransactions (CreateBankFeedTransactions)
import Types.Transactions (Transactions)

data CreateCreateBankFeedTransactionsRequest = CreateCreateBankFeedTransactionsRequest
  { bankFeedTransactions :: CreateBankFeedTransactions
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateBankFeedTransactionsRequest where
  parseJSON = withObject "CreateCreateBankFeedTransactionsRequest" $ \obj -> do
    bankFeedTransactions <- obj .: "bank_feed_transactions"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateBankFeedTransactionsRequest{..}

instance ToJSON CreateCreateBankFeedTransactionsRequest where
  toJSON CreateCreateBankFeedTransactionsRequest{..} =
    object [
      "bank_feed_transactions" .= bankFeedTransactions,
      "response_mode" .= responseMode
    ]
