{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.SalesOrder where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Item11 (Item11)
import Types.LineItems19 (LineItems19)

data SalesOrder = SalesOrder
  { classId :: Maybe Text
  , createdAt :: Maybe Text
  , currencyCode :: Maybe Text
  , currencyRate :: Maybe Double
  , customerId :: Maybe Text
  , departmentId :: Maybe Text
  , discountAmount :: Maybe Double
  , documentNumber :: Maybe Text
  , id :: Text
  , issueDate :: Text
  , lastSyncedAt :: Text
  , lineItems :: [LineItems19]
  , locationId :: Maybe Text
  , memo :: Maybe Text
  , paymentTermsId :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , referenceNumber :: Maybe Text
  , status :: Text
  , subsidiaryId :: Maybe Text
  , taxAmount :: Maybe Double
  , totalAmount :: Maybe Double
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON SalesOrder where
  parseJSON = withObject "SalesOrder" $ \obj -> do
    classId <- obj .: "class_id"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    currencyRate <- obj .: "currency_rate"
    customerId <- obj .: "customer_id"
    departmentId <- obj .: "department_id"
    discountAmount <- obj .: "discount_amount"
    documentNumber <- obj .: "document_number"
    id <- obj .: "id"
    issueDate <- obj .: "issue_date"
    lastSyncedAt <- obj .: "last_synced_at"
    lineItems <- obj .: "line_items"
    locationId <- obj .: "location_id"
    memo <- obj .: "memo"
    paymentTermsId <- obj .: "payment_terms_id"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    referenceNumber <- obj .: "reference_number"
    status <- obj .: "status"
    subsidiaryId <- obj .: "subsidiary_id"
    taxAmount <- obj .: "tax_amount"
    totalAmount <- obj .: "total_amount"
    updatedAt <- obj .: "updated_at"
    pure $ SalesOrder{..}

instance ToJSON SalesOrder where
  toJSON SalesOrder{..} =
    object [
      "class_id" .= classId,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "currency_rate" .= currencyRate,
      "customer_id" .= customerId,
      "department_id" .= departmentId,
      "discount_amount" .= discountAmount,
      "document_number" .= documentNumber,
      "id" .= id,
      "issue_date" .= issueDate,
      "last_synced_at" .= lastSyncedAt,
      "line_items" .= lineItems,
      "location_id" .= locationId,
      "memo" .= memo,
      "payment_terms_id" .= paymentTermsId,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "reference_number" .= referenceNumber,
      "status" .= status,
      "subsidiary_id" .= subsidiaryId,
      "tax_amount" .= taxAmount,
      "total_amount" .= totalAmount,
      "updated_at" .= updatedAt
    ]
