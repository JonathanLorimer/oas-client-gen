{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PurchaseOrder where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Item10 (Item10)
import Types.LineItems16 (LineItems16)

data PurchaseOrder = PurchaseOrder
  { createdAt :: Maybe Text
  , currencyCode :: Maybe Text
  , documentNumber :: Maybe Text
  , id :: Text
  , issueDate :: Text
  , lastSyncedAt :: Text
  , lineItems :: [LineItems16]
  , memo :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , status :: Text
  , subsidiaryId :: Maybe Text
  , totalAmount :: Maybe Double
  , totalQuantity :: Maybe Double
  , updatedAt :: Maybe Text
  , vendorId :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON PurchaseOrder where
  parseJSON = withObject "PurchaseOrder" $ \obj -> do
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    documentNumber <- obj .: "document_number"
    id <- obj .: "id"
    issueDate <- obj .: "issue_date"
    lastSyncedAt <- obj .: "last_synced_at"
    lineItems <- obj .: "line_items"
    memo <- obj .: "memo"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    status <- obj .: "status"
    subsidiaryId <- obj .: "subsidiary_id"
    totalAmount <- obj .: "total_amount"
    totalQuantity <- obj .: "total_quantity"
    updatedAt <- obj .: "updated_at"
    vendorId <- obj .: "vendor_id"
    pure $ PurchaseOrder{..}

instance ToJSON PurchaseOrder where
  toJSON PurchaseOrder{..} =
    object [
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "document_number" .= documentNumber,
      "id" .= id,
      "issue_date" .= issueDate,
      "last_synced_at" .= lastSyncedAt,
      "line_items" .= lineItems,
      "memo" .= memo,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "status" .= status,
      "subsidiary_id" .= subsidiaryId,
      "total_amount" .= totalAmount,
      "total_quantity" .= totalQuantity,
      "updated_at" .= updatedAt,
      "vendor_id" .= vendorId
    ]
