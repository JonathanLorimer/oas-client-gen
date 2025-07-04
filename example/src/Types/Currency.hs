{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Currency where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data Currency = Currency
  { createdAt :: Maybe Text
  , currencyCode :: Text
  , currencyName :: Maybe Text
  , id :: Text
  , lastSyncedAt :: Text
  , platformData :: Map Text Value
  , updatedAt :: Text
  }
  deriving (Show, Eq)

instance FromJSON Currency where
  parseJSON = withObject "Currency" $ \obj -> do
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    currencyName <- obj .: "currency_name"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    platformData <- obj .: "platform_data"
    updatedAt <- obj .: "updated_at"
    pure $ Currency{..}

instance ToJSON Currency where
  toJSON Currency{..} =
    object [
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "currency_name" .= currencyName,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "platform_data" .= platformData,
      "updated_at" .= updatedAt
    ]
