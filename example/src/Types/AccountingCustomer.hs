{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AccountingCustomer where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Addresses (Addresses)

data AccountingCustomer = AccountingCustomer
  { addresses :: [Addresses]
  , contactName :: Maybe Text
  , createdAt :: Maybe Text
  , currencyCode :: Maybe Text
  , customerName :: Maybe Text
  , email :: Maybe Text
  , id :: Text
  , lastSyncedAt :: Text
  , parentId :: Maybe Text
  , paymentTermsId :: Maybe Text
  , phone :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , registrationNumber :: Maybe Text
  , status :: Text
  , subsidiaryId :: Maybe Text
  , taxNumber :: Maybe Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON AccountingCustomer where
  parseJSON = withObject "AccountingCustomer" $ \obj -> do
    addresses <- obj .: "addresses"
    contactName <- obj .: "contact_name"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    customerName <- obj .: "customer_name"
    email <- obj .: "email"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    parentId <- obj .: "parent_id"
    paymentTermsId <- obj .: "payment_terms_id"
    phone <- obj .: "phone"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    registrationNumber <- obj .: "registration_number"
    status <- obj .: "status"
    subsidiaryId <- obj .: "subsidiary_id"
    taxNumber <- obj .: "tax_number"
    updatedAt <- obj .: "updated_at"
    pure $ AccountingCustomer{..}

instance ToJSON AccountingCustomer where
  toJSON AccountingCustomer{..} =
    object [
      "addresses" .= addresses,
      "contact_name" .= contactName,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "customer_name" .= customerName,
      "email" .= email,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "parent_id" .= parentId,
      "payment_terms_id" .= paymentTermsId,
      "phone" .= phone,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "registration_number" .= registrationNumber,
      "status" .= status,
      "subsidiary_id" .= subsidiaryId,
      "tax_number" .= taxNumber,
      "updated_at" .= updatedAt
    ]
