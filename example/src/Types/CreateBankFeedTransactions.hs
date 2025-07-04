{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBankFeedTransactions where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Transactions (Transactions)

data CreateBankFeedTransactions = CreateBankFeedTransactions
  { bankFeedAccountId :: Text
  , currentBalance :: Double
  , transactions :: [Transactions]
  }
  deriving (Show, Eq)

instance FromJSON CreateBankFeedTransactions where
  parseJSON = withObject "CreateBankFeedTransactions" $ \obj -> do
    bankFeedAccountId <- obj .: "bank_feed_account_id"
    currentBalance <- obj .: "current_balance"
    transactions <- obj .: "transactions"
    pure $ CreateBankFeedTransactions{..}

instance ToJSON CreateBankFeedTransactions where
  toJSON CreateBankFeedTransactions{..} =
    object [
      "bank_feed_account_id" .= bankFeedAccountId,
      "current_balance" .= currentBalance,
      "transactions" .= transactions
    ]
