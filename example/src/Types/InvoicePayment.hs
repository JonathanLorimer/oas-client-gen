{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.InvoicePayment where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields24 (AdditionalFields24)
import Types.LinkedInvoices2 (LinkedInvoices2)
import Types.LinkedJournalEntries2 (LinkedJournalEntries2)

data InvoicePayment = InvoicePayment
  { accountId :: Text
  , additionalFields :: AdditionalFields24
  , arAccountId :: Text
  , createdAt :: Maybe Text
  , currencyCode :: Maybe Text
  , currencyRate :: Maybe Double
  , customerId :: Maybe Text
  , deposited :: Maybe Bool
  , id :: Text
  , lastSyncedAt :: Text
  , linkedInvoices :: [LinkedInvoices2]
  , memo :: Maybe Text
  , paymentMethodId :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , reference :: Maybe Text
  , totalAmount :: Maybe Text
  , txnDate :: Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON InvoicePayment where
  parseJSON = withObject "InvoicePayment" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    arAccountId <- obj .: "ar_account_id"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    currencyRate <- obj .: "currency_rate"
    customerId <- obj .: "customer_id"
    deposited <- obj .: "deposited"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    linkedInvoices <- obj .: "linked_invoices"
    memo <- obj .: "memo"
    paymentMethodId <- obj .: "payment_method_id"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    reference <- obj .: "reference"
    totalAmount <- obj .: "total_amount"
    txnDate <- obj .: "txn_date"
    updatedAt <- obj .: "updated_at"
    pure $ InvoicePayment{..}

instance ToJSON InvoicePayment where
  toJSON InvoicePayment{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "ar_account_id" .= arAccountId,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "currency_rate" .= currencyRate,
      "customer_id" .= customerId,
      "deposited" .= deposited,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "linked_invoices" .= linkedInvoices,
      "memo" .= memo,
      "payment_method_id" .= paymentMethodId,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "reference" .= reference,
      "total_amount" .= totalAmount,
      "txn_date" .= txnDate,
      "updated_at" .= updatedAt
    ]
