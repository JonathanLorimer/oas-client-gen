{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.JournalEntry where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields31 (AdditionalFields31)
import Types.AdditionalFields32 (AdditionalFields32)
import Types.LineItems14 (LineItems14)

data JournalEntry = JournalEntry
  { additionalFields :: AdditionalFields31
  , createdAt :: Maybe Text
  , currencyCode :: Maybe Text
  , currencyRate :: Double
  , deposited :: Maybe Bool
  , id :: Text
  , lastSyncedAt :: Text
  , lineItems :: [LineItems14]
  , memo :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , subsidiaryId :: Maybe Text
  , transactionDate :: Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON JournalEntry where
  parseJSON = withObject "JournalEntry" $ \obj -> do
    additionalFields <- obj .: "additional_fields"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    currencyRate <- obj .: "currency_rate"
    deposited <- obj .: "deposited"
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
    pure $ JournalEntry{..}

instance ToJSON JournalEntry where
  toJSON JournalEntry{..} =
    object [
      "additional_fields" .= additionalFields,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "currency_rate" .= currencyRate,
      "deposited" .= deposited,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "line_items" .= lineItems,
      "memo" .= memo,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "subsidiary_id" .= subsidiaryId,
      "transaction_date" .= transactionDate,
      "updated_at" .= updatedAt
    ]
