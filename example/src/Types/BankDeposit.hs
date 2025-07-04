{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankDeposit where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.LineItems (LineItems)
import Types.LinkedPayments (LinkedPayments)

data BankDeposit = BankDeposit
  { accountId :: Maybe Text
  , createdAt :: Maybe Text
  , currencyCode :: Text
  , id :: Text
  , lastSyncedAt :: Text
  , lineItems :: [LineItems]
  , linkedPayments :: [LinkedPayments]
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

instance FromJSON BankDeposit where
  parseJSON = withObject "BankDeposit" $ \obj -> do
    accountId <- obj .: "account_id"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    lineItems <- obj .: "line_items"
    linkedPayments <- obj .: "linked_payments"
    memo <- obj .: "memo"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    subsidiaryId <- obj .: "subsidiary_id"
    totalAmount <- obj .: "total_amount"
    transactionDate <- obj .: "transaction_date"
    updatedAt <- obj .: "updated_at"
    pure $ BankDeposit{..}

instance ToJSON BankDeposit where
  toJSON BankDeposit{..} =
    object [
      "account_id" .= accountId,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "line_items" .= lineItems,
      "linked_payments" .= linkedPayments,
      "memo" .= memo,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "subsidiary_id" .= subsidiaryId,
      "total_amount" .= totalAmount,
      "transaction_date" .= transactionDate,
      "updated_at" .= updatedAt
    ]
