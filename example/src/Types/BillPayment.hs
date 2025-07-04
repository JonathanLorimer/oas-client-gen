{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BillPayment where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields7 (AdditionalFields7)
import Types.LinkedBills2 (LinkedBills2)
import Types.LinkedJournalEntries (LinkedJournalEntries)

data BillPayment = BillPayment
  { accountId :: Maybe Text
  , additionalFields :: AdditionalFields7
  , createdAt :: Maybe Text
  , currencyCode :: Text
  , currencyRate :: Maybe Text
  , documentNumber :: Maybe Text
  , id :: Text
  , lastSyncedAt :: Text
  , linkedBills :: [LinkedBills2]
  , memo :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , reference :: Maybe Text
  , status :: Maybe Text
  , totalAmount :: Maybe Double
  , transactionDate :: Text
  , updatedAt :: Maybe Text
  , vendorId :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON BillPayment where
  parseJSON = withObject "BillPayment" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    currencyRate <- obj .: "currency_rate"
    documentNumber <- obj .: "document_number"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    linkedBills <- obj .: "linked_bills"
    memo <- obj .: "memo"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    reference <- obj .: "reference"
    status <- obj .: "status"
    totalAmount <- obj .: "total_amount"
    transactionDate <- obj .: "transaction_date"
    updatedAt <- obj .: "updated_at"
    vendorId <- obj .: "vendor_id"
    pure $ BillPayment{..}

instance ToJSON BillPayment where
  toJSON BillPayment{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "currency_rate" .= currencyRate,
      "document_number" .= documentNumber,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "linked_bills" .= linkedBills,
      "memo" .= memo,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "reference" .= reference,
      "status" .= status,
      "total_amount" .= totalAmount,
      "transaction_date" .= transactionDate,
      "updated_at" .= updatedAt,
      "vendor_id" .= vendorId
    ]
