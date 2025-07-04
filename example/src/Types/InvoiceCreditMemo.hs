{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.InvoiceCreditMemo where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields21 (AdditionalFields21)
import Types.LineItems10 (LineItems10)
import Types.LinkedInvoices1 (LinkedInvoices1)

data InvoiceCreditMemo = InvoiceCreditMemo
  { accountId :: Maybe Text
  , allocatedAt :: Maybe Text
  , createdAt :: Maybe Text
  , currencyCode :: Maybe Text
  , customerId :: Maybe Text
  , documentNumber :: Maybe Text
  , id :: Text
  , issueDate :: Maybe Text
  , lastSyncedAt :: Text
  , lineItems :: [LineItems10]
  , linkedInvoices :: [LinkedInvoices1]
  , memo :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , remainingAmount :: Maybe Text
  , status :: Maybe Text
  , totalAmount :: Maybe Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON InvoiceCreditMemo where
  parseJSON = withObject "InvoiceCreditMemo" $ \obj -> do
    accountId <- obj .: "account_id"
    allocatedAt <- obj .: "allocated_at"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    customerId <- obj .: "customer_id"
    documentNumber <- obj .: "document_number"
    id <- obj .: "id"
    issueDate <- obj .: "issue_date"
    lastSyncedAt <- obj .: "last_synced_at"
    lineItems <- obj .: "line_items"
    linkedInvoices <- obj .: "linked_invoices"
    memo <- obj .: "memo"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    remainingAmount <- obj .: "remaining_amount"
    status <- obj .: "status"
    totalAmount <- obj .: "total_amount"
    updatedAt <- obj .: "updated_at"
    pure $ InvoiceCreditMemo{..}

instance ToJSON InvoiceCreditMemo where
  toJSON InvoiceCreditMemo{..} =
    object [
      "account_id" .= accountId,
      "allocated_at" .= allocatedAt,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "customer_id" .= customerId,
      "document_number" .= documentNumber,
      "id" .= id,
      "issue_date" .= issueDate,
      "last_synced_at" .= lastSyncedAt,
      "line_items" .= lineItems,
      "linked_invoices" .= linkedInvoices,
      "memo" .= memo,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "remaining_amount" .= remainingAmount,
      "status" .= status,
      "total_amount" .= totalAmount,
      "updated_at" .= updatedAt
    ]
