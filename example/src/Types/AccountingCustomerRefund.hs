{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AccountingCustomerRefund where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields14 (AdditionalFields14)
import Types.Item4 (Item4)
import Types.LineItems6 (LineItems6)

data AccountingCustomerRefund = AccountingCustomerRefund
  { accountId :: Text
  , classId :: Maybe Text
  , createdAt :: Maybe Text
  , currencyCode :: Maybe Text
  , currencyRate :: Maybe Double
  , customerId :: Maybe Text
  , departmentId :: Maybe Text
  , discountAmount :: Maybe Double
  , documentNumber :: Maybe Text
  , id :: Text
  , lastSyncedAt :: Text
  , lineItems :: [LineItems6]
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , taxAmount :: Maybe Double
  , taxRateId :: Maybe Text
  , totalAmount :: Double
  , transactionDate :: Maybe Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON AccountingCustomerRefund where
  parseJSON = withObject "AccountingCustomerRefund" $ \obj -> do
    accountId <- obj .: "account_id"
    classId <- obj .: "class_id"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    currencyRate <- obj .: "currency_rate"
    customerId <- obj .: "customer_id"
    departmentId <- obj .: "department_id"
    discountAmount <- obj .: "discount_amount"
    documentNumber <- obj .: "document_number"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    lineItems <- obj .: "line_items"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    taxAmount <- obj .: "tax_amount"
    taxRateId <- obj .: "tax_rate_id"
    totalAmount <- obj .: "total_amount"
    transactionDate <- obj .: "transaction_date"
    updatedAt <- obj .: "updated_at"
    pure $ AccountingCustomerRefund{..}

instance ToJSON AccountingCustomerRefund where
  toJSON AccountingCustomerRefund{..} =
    object [
      "account_id" .= accountId,
      "class_id" .= classId,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "currency_rate" .= currencyRate,
      "customer_id" .= customerId,
      "department_id" .= departmentId,
      "discount_amount" .= discountAmount,
      "document_number" .= documentNumber,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "line_items" .= lineItems,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "tax_amount" .= taxAmount,
      "tax_rate_id" .= taxRateId,
      "total_amount" .= totalAmount,
      "transaction_date" .= transactionDate,
      "updated_at" .= updatedAt
    ]
