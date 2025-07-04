{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBankDeposit where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields1 (AdditionalFields1)
import Types.LineItems1 (LineItems1)
import Types.LinkedPayments1 (LinkedPayments1)

data CreateBankDeposit = CreateBankDeposit
  { accountId :: Text
  , additionalFields :: AdditionalFields1
  , lineItems :: [LineItems1]
  , linkedPayments :: [LinkedPayments1]
  , memo :: Text
  , transactionDate :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateBankDeposit where
  parseJSON = withObject "CreateBankDeposit" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    lineItems <- obj .: "line_items"
    linkedPayments <- obj .: "linked_payments"
    memo <- obj .: "memo"
    transactionDate <- obj .: "transaction_date"
    pure $ CreateBankDeposit{..}

instance ToJSON CreateBankDeposit where
  toJSON CreateBankDeposit{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "line_items" .= lineItems,
      "linked_payments" .= linkedPayments,
      "memo" .= memo,
      "transaction_date" .= transactionDate
    ]
