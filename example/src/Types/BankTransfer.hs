{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankTransfer where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data BankTransfer = BankTransfer
  { classId :: Maybe Text
  , createdAt :: Maybe Text
  , creditAccountId :: Maybe Text
  , currencyCode :: Text
  , debitAccountId :: Maybe Text
  , departmentId :: Maybe Text
  , id :: Text
  , lastSyncedAt :: Text
  , locationId :: Maybe Text
  , memo :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , subsidiaryId :: Maybe Text
  , totalAmount :: Double
  , transactionDate :: Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON BankTransfer where
  parseJSON = withObject "BankTransfer" $ \obj -> do
    classId <- obj .: "class_id"
    createdAt <- obj .: "created_at"
    creditAccountId <- obj .: "credit_account_id"
    currencyCode <- obj .: "currency_code"
    debitAccountId <- obj .: "debit_account_id"
    departmentId <- obj .: "department_id"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    locationId <- obj .: "location_id"
    memo <- obj .: "memo"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    subsidiaryId <- obj .: "subsidiary_id"
    totalAmount <- obj .: "total_amount"
    transactionDate <- obj .: "transaction_date"
    updatedAt <- obj .: "updated_at"
    pure $ BankTransfer{..}

instance ToJSON BankTransfer where
  toJSON BankTransfer{..} =
    object [
      "class_id" .= classId,
      "created_at" .= createdAt,
      "credit_account_id" .= creditAccountId,
      "currency_code" .= currencyCode,
      "debit_account_id" .= debitAccountId,
      "department_id" .= departmentId,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "location_id" .= locationId,
      "memo" .= memo,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "subsidiary_id" .= subsidiaryId,
      "total_amount" .= totalAmount,
      "transaction_date" .= transactionDate,
      "updated_at" .= updatedAt
    ]
