{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CompanyInfo20240430 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields13 (AdditionalFields13)

data CompanyInfo20240430 = CompanyInfo20240430
  { additionalFields :: AdditionalFields13
  , addresses :: Text
  , createdAt :: Maybe Text
  , currencyCode :: Text
  , id :: Text
  , lastSyncedAt :: Text
  , legalName :: Maybe Text
  , name :: Text
  , platformData :: Map Text Value
  , platformId :: Maybe Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON CompanyInfo20240430 where
  parseJSON = withObject "CompanyInfo20240430" $ \obj -> do
    additionalFields <- obj .: "additional_fields"
    addresses <- obj .: "addresses"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    legalName <- obj .: "legal_name"
    name <- obj .: "name"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    updatedAt <- obj .: "updated_at"
    pure $ CompanyInfo20240430{..}

instance ToJSON CompanyInfo20240430 where
  toJSON CompanyInfo20240430{..} =
    object [
      "additional_fields" .= additionalFields,
      "addresses" .= addresses,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "legal_name" .= legalName,
      "name" .= name,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "updated_at" .= updatedAt
    ]
