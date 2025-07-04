{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.HrisOrganization where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Address (Address)

data HrisOrganization = HrisOrganization
  { address :: Maybe Address
  , contactEmail :: Maybe Text
  , contactPhone :: Maybe Text
  , createdAt :: Maybe Text
  , customFields :: Map Text Value
  , id :: Text
  , industry :: Maybe Text
  , lastSyncedAt :: Text
  , legalName :: Maybe Text
  , logoUrl :: Maybe Text
  , name :: Text
  , numberOfEmployees :: Maybe Double
  , platformData :: Map Text Value
  , platformId :: Text
  , taxId :: Maybe Text
  , updatedAt :: Maybe Text
  , website :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON HrisOrganization where
  parseJSON = withObject "HrisOrganization" $ \obj -> do
    address <- obj .: "address"
    contactEmail <- obj .: "contact_email"
    contactPhone <- obj .: "contact_phone"
    createdAt <- obj .: "created_at"
    customFields <- obj .: "custom_fields"
    id <- obj .: "id"
    industry <- obj .: "industry"
    lastSyncedAt <- obj .: "last_synced_at"
    legalName <- obj .: "legal_name"
    logoUrl <- obj .: "logo_url"
    name <- obj .: "name"
    numberOfEmployees <- obj .: "number_of_employees"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    taxId <- obj .: "tax_id"
    updatedAt <- obj .: "updated_at"
    website <- obj .: "website"
    pure $ HrisOrganization{..}

instance ToJSON HrisOrganization where
  toJSON HrisOrganization{..} =
    object [
      "address" .= address,
      "contact_email" .= contactEmail,
      "contact_phone" .= contactPhone,
      "created_at" .= createdAt,
      "custom_fields" .= customFields,
      "id" .= id,
      "industry" .= industry,
      "last_synced_at" .= lastSyncedAt,
      "legal_name" .= legalName,
      "logo_url" .= logoUrl,
      "name" .= name,
      "number_of_employees" .= numberOfEmployees,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "tax_id" .= taxId,
      "updated_at" .= updatedAt,
      "website" .= website
    ]
