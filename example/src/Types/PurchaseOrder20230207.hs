{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PurchaseOrder20230207 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.LineItems18 (LineItems18)

data PurchaseOrder20230207 = PurchaseOrder20230207
  { createdAt :: Maybe Text
  , currencyCode :: Maybe Text
  , documentNumber :: Maybe Text
  , id :: Text
  , lastSyncedAt :: Text
  , lineItems :: [LineItems18]
  , memo :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , postedDate :: Text
  , status :: Maybe Text
  , subsidiaryId :: Maybe Text
  , totalAmount :: Maybe Text
  , totalQuantity :: Maybe Text
  , updatedAt :: Maybe Text
  , vendorId :: Maybe Text
  , vendorName :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON PurchaseOrder20230207 where
  parseJSON = withObject "PurchaseOrder20230207" $ \obj -> do
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    documentNumber <- obj .: "document_number"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    lineItems <- obj .: "line_items"
    memo <- obj .: "memo"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    postedDate <- obj .: "posted_date"
    status <- obj .: "status"
    subsidiaryId <- obj .: "subsidiary_id"
    totalAmount <- obj .: "total_amount"
    totalQuantity <- obj .: "total_quantity"
    updatedAt <- obj .: "updated_at"
    vendorId <- obj .: "vendor_id"
    vendorName <- obj .: "vendor_name"
    pure $ PurchaseOrder20230207{..}

instance ToJSON PurchaseOrder20230207 where
  toJSON PurchaseOrder20230207{..} =
    object [
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "document_number" .= documentNumber,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "line_items" .= lineItems,
      "memo" .= memo,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "posted_date" .= postedDate,
      "status" .= status,
      "subsidiary_id" .= subsidiaryId,
      "total_amount" .= totalAmount,
      "total_quantity" .= totalQuantity,
      "updated_at" .= updatedAt,
      "vendor_id" .= vendorId,
      "vendor_name" .= vendorName
    ]
