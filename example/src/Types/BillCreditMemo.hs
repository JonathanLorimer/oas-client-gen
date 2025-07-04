{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BillCreditMemo where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields5 (AdditionalFields5)
import Types.Item (Item)
import Types.LineItems2 (LineItems2)
import Types.LinkedBills1 (LinkedBills1)

data BillCreditMemo = BillCreditMemo
  { accountId :: Maybe Text
  , createdAt :: Maybe Text
  , currencyCode :: Maybe Text
  , documentNumber :: Text
  , id :: Text
  , issueDate :: Text
  , lastSyncedAt :: Text
  , lineItems :: [LineItems2]
  , linkedBills :: [LinkedBills1]
  , memo :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , remainingAmount :: Double
  , status :: Text
  , totalAmount :: Double
  , updatedAt :: Maybe Text
  , vendorId :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON BillCreditMemo where
  parseJSON = withObject "BillCreditMemo" $ \obj -> do
    accountId <- obj .: "account_id"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    documentNumber <- obj .: "document_number"
    id <- obj .: "id"
    issueDate <- obj .: "issue_date"
    lastSyncedAt <- obj .: "last_synced_at"
    lineItems <- obj .: "line_items"
    linkedBills <- obj .: "linked_bills"
    memo <- obj .: "memo"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    remainingAmount <- obj .: "remaining_amount"
    status <- obj .: "status"
    totalAmount <- obj .: "total_amount"
    updatedAt <- obj .: "updated_at"
    vendorId <- obj .: "vendor_id"
    pure $ BillCreditMemo{..}

instance ToJSON BillCreditMemo where
  toJSON BillCreditMemo{..} =
    object [
      "account_id" .= accountId,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "document_number" .= documentNumber,
      "id" .= id,
      "issue_date" .= issueDate,
      "last_synced_at" .= lastSyncedAt,
      "line_items" .= lineItems,
      "linked_bills" .= linkedBills,
      "memo" .= memo,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "remaining_amount" .= remainingAmount,
      "status" .= status,
      "total_amount" .= totalAmount,
      "updated_at" .= updatedAt,
      "vendor_id" .= vendorId
    ]
