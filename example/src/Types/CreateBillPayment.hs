{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBillPayment where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields8 (AdditionalFields8)
import Types.LinkedBills3 (LinkedBills3)

data CreateBillPayment = CreateBillPayment
  { accountId :: Text
  , additionalFields :: AdditionalFields8
  , currencyCode :: Text
  , currencyRate :: Double
  , documentNumber :: Text
  , linkedBills :: [LinkedBills3]
  , memo :: Text
  , reference :: Text
  , transactionDate :: Text
  , vendorId :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateBillPayment where
  parseJSON = withObject "CreateBillPayment" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    currencyCode <- obj .: "currency_code"
    currencyRate <- obj .: "currency_rate"
    documentNumber <- obj .: "document_number"
    linkedBills <- obj .: "linked_bills"
    memo <- obj .: "memo"
    reference <- obj .: "reference"
    transactionDate <- obj .: "transaction_date"
    vendorId <- obj .: "vendor_id"
    pure $ CreateBillPayment{..}

instance ToJSON CreateBillPayment where
  toJSON CreateBillPayment{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "currency_code" .= currencyCode,
      "currency_rate" .= currencyRate,
      "document_number" .= documentNumber,
      "linked_bills" .= linkedBills,
      "memo" .= memo,
      "reference" .= reference,
      "transaction_date" .= transactionDate,
      "vendor_id" .= vendorId
    ]
