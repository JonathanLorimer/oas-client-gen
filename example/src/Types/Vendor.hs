{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Vendor where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Addresses4 (Addresses4)
import Types.Subsidiaries4 (Subsidiaries4)

data Vendor = Vendor
  { addresses :: [Addresses4]
  , bankAccountNumber :: Maybe Text
  , contactName :: Maybe Text
  , createdAt :: Maybe Text
  , currencyCodes :: Text
  , email :: Maybe Text
  , id :: Text
  , lastSyncedAt :: Text
  , paymentTermsId :: Maybe Text
  , phone :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , registrationNumber :: Maybe Text
  , status :: Text
  , subsidiaries :: [Subsidiaries4]
  , taxNumber :: Maybe Text
  , updatedAt :: Maybe Text
  , vendorName :: Maybe Text
  , website :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Vendor where
  parseJSON = withObject "Vendor" $ \obj -> do
    addresses <- obj .: "addresses"
    bankAccountNumber <- obj .: "bank_account_number"
    contactName <- obj .: "contact_name"
    createdAt <- obj .: "created_at"
    currencyCodes <- obj .: "currency_codes"
    email <- obj .: "email"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    paymentTermsId <- obj .: "payment_terms_id"
    phone <- obj .: "phone"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    registrationNumber <- obj .: "registration_number"
    status <- obj .: "status"
    subsidiaries <- obj .: "subsidiaries"
    taxNumber <- obj .: "tax_number"
    updatedAt <- obj .: "updated_at"
    vendorName <- obj .: "vendor_name"
    website <- obj .: "website"
    pure $ Vendor{..}

instance ToJSON Vendor where
  toJSON Vendor{..} =
    object [
      "addresses" .= addresses,
      "bank_account_number" .= bankAccountNumber,
      "contact_name" .= contactName,
      "created_at" .= createdAt,
      "currency_codes" .= currencyCodes,
      "email" .= email,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "payment_terms_id" .= paymentTermsId,
      "phone" .= phone,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "registration_number" .= registrationNumber,
      "status" .= status,
      "subsidiaries" .= subsidiaries,
      "tax_number" .= taxNumber,
      "updated_at" .= updatedAt,
      "vendor_name" .= vendorName,
      "website" .= website
    ]
