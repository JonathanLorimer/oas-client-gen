{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Transactions where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Transactions = Transactions
  { amount :: Double
  , debitCreditMemo :: Text
  , description :: Text
  , interestAmount :: Double
  , memo :: Text
  , payee :: Text
  , postedAt :: Text
  , principalAmount :: Double
  , transactionDate :: Text
  , transactionId :: Text
  , transactionType :: Text
  }
  deriving (Show, Eq)

instance FromJSON Transactions where
  parseJSON = withObject "Transactions" $ \obj -> do
    amount <- obj .: "amount"
    debitCreditMemo <- obj .: "debit_credit_memo"
    description <- obj .: "description"
    interestAmount <- obj .: "interest_amount"
    memo <- obj .: "memo"
    payee <- obj .: "payee"
    postedAt <- obj .: "posted_at"
    principalAmount <- obj .: "principal_amount"
    transactionDate <- obj .: "transaction_date"
    transactionId <- obj .: "transaction_id"
    transactionType <- obj .: "transaction_type"
    pure $ Transactions{..}

instance ToJSON Transactions where
  toJSON Transactions{..} =
    object [
      "amount" .= amount,
      "debit_credit_memo" .= debitCreditMemo,
      "description" .= description,
      "interest_amount" .= interestAmount,
      "memo" .= memo,
      "payee" .= payee,
      "posted_at" .= postedAt,
      "principal_amount" .= principalAmount,
      "transaction_date" .= transactionDate,
      "transaction_id" .= transactionId,
      "transaction_type" .= transactionType
    ]
