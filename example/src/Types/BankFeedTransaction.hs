{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankFeedTransaction where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BankFeedTransaction = BankFeedTransaction
  { amount :: Maybe Double
  , bankFeedAccountId :: Maybe Text
  , debitCreditMemo :: Maybe Text
  , description :: Maybe Text
  , id :: Text
  , interestAmount :: Maybe Double
  , lastSyncedAt :: Text
  , memo :: Maybe Text
  , payee :: Maybe Text
  , platformIngested :: Maybe Bool
  , postedAt :: Maybe Text
  , principalAmount :: Maybe Double
  , transactionDate :: Maybe Text
  , transactionId :: Maybe Text
  , transactionType :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON BankFeedTransaction where
  parseJSON = withObject "BankFeedTransaction" $ \obj -> do
    amount <- obj .: "amount"
    bankFeedAccountId <- obj .: "bank_feed_account_id"
    debitCreditMemo <- obj .: "debit_credit_memo"
    description <- obj .: "description"
    id <- obj .: "id"
    interestAmount <- obj .: "interest_amount"
    lastSyncedAt <- obj .: "last_synced_at"
    memo <- obj .: "memo"
    payee <- obj .: "payee"
    platformIngested <- obj .: "platform_ingested"
    postedAt <- obj .: "posted_at"
    principalAmount <- obj .: "principal_amount"
    transactionDate <- obj .: "transaction_date"
    transactionId <- obj .: "transaction_id"
    transactionType <- obj .: "transaction_type"
    pure $ BankFeedTransaction{..}

instance ToJSON BankFeedTransaction where
  toJSON BankFeedTransaction{..} =
    object [
      "amount" .= amount,
      "bank_feed_account_id" .= bankFeedAccountId,
      "debit_credit_memo" .= debitCreditMemo,
      "description" .= description,
      "id" .= id,
      "interest_amount" .= interestAmount,
      "last_synced_at" .= lastSyncedAt,
      "memo" .= memo,
      "payee" .= payee,
      "platform_ingested" .= platformIngested,
      "posted_at" .= postedAt,
      "principal_amount" .= principalAmount,
      "transaction_date" .= transactionDate,
      "transaction_id" .= transactionId,
      "transaction_type" .= transactionType
    ]
