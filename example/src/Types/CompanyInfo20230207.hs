{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CompanyInfo20230207 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields36 (AdditionalFields36)

data CompanyInfo20230207 = CompanyInfo20230207
  { additionalFields :: AdditionalFields36
  , addresses :: Text
  , baseCurrencyCode :: Text
  , createdAt :: Text
  , id :: Text
  , lastSyncedAt :: Text
  , legalName :: Text
  , name :: Text
  , platformData :: Map Text Value
  , platformId :: Maybe Text
  , updatedAt :: Text
  }
  deriving (Show, Eq)

instance FromJSON CompanyInfo20230207 where
  parseJSON = withObject "CompanyInfo20230207" $ \obj -> do
    additionalFields <- obj .: "additional_fields"
    addresses <- obj .: "addresses"
    baseCurrencyCode <- obj .: "base_currency_code"
    createdAt <- obj .: "createdAt"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    legalName <- obj .: "legal_name"
    name <- obj .: "name"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    updatedAt <- obj .: "updatedAt"
    pure $ CompanyInfo20230207{..}

instance ToJSON CompanyInfo20230207 where
  toJSON CompanyInfo20230207{..} =
    object [
      "additional_fields" .= additionalFields,
      "addresses" .= addresses,
      "base_currency_code" .= baseCurrencyCode,
      "createdAt" .= createdAt,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "legal_name" .= legalName,
      "name" .= name,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "updatedAt" .= updatedAt
    ]
