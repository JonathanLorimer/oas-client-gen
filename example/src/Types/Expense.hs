{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Expense where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields18 (AdditionalFields18)
import Types.LineItems8 (LineItems8)

data Expense = Expense
  { accountId :: Maybe Text
  , createdAt :: Maybe Text
  , currencyCode :: Text
  , currencyRate :: Double
  , customerId :: Maybe Text
  , expenseType :: Text
  , id :: Text
  , lastSyncedAt :: Text
  , lineItems :: [LineItems8]
  , memo :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , subsidiaryId :: Maybe Text
  , transactionDate :: Text
  , updatedAt :: Maybe Text
  , vendorId :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Expense where
  parseJSON = withObject "Expense" $ \obj -> do
    accountId <- obj .: "account_id"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    currencyRate <- obj .: "currency_rate"
    customerId <- obj .: "customer_id"
    expenseType <- obj .: "expense_type"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    lineItems <- obj .: "line_items"
    memo <- obj .: "memo"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    subsidiaryId <- obj .: "subsidiary_id"
    transactionDate <- obj .: "transaction_date"
    updatedAt <- obj .: "updated_at"
    vendorId <- obj .: "vendor_id"
    pure $ Expense{..}

instance ToJSON Expense where
  toJSON Expense{..} =
    object [
      "account_id" .= accountId,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "currency_rate" .= currencyRate,
      "customer_id" .= customerId,
      "expense_type" .= expenseType,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "line_items" .= lineItems,
      "memo" .= memo,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "subsidiary_id" .= subsidiaryId,
      "transaction_date" .= transactionDate,
      "updated_at" .= updatedAt,
      "vendor_id" .= vendorId
    ]
