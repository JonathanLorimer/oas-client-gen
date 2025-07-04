{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.TaxRate where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields38 (AdditionalFields38)
import Types.Components (Components)
import Types.Subsidiaries3 (Subsidiaries3)

data TaxRate = TaxRate
  { additionalFields :: AdditionalFields38
  , code :: Maybe Text
  , components :: [Components]
  , createdAt :: Maybe Text
  , effectiveTaxRate :: Maybe Double
  , id :: Text
  , lastSyncedAt :: Text
  , name :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , status :: Text
  , subsidiaries :: [Subsidiaries3]
  , totalTaxRate :: Maybe Double
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON TaxRate where
  parseJSON = withObject "TaxRate" $ \obj -> do
    additionalFields <- obj .: "additional_fields"
    code <- obj .: "code"
    components <- obj .: "components"
    createdAt <- obj .: "created_at"
    effectiveTaxRate <- obj .: "effective_tax_rate"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    name <- obj .: "name"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    status <- obj .: "status"
    subsidiaries <- obj .: "subsidiaries"
    totalTaxRate <- obj .: "total_tax_rate"
    updatedAt <- obj .: "updated_at"
    pure $ TaxRate{..}

instance ToJSON TaxRate where
  toJSON TaxRate{..} =
    object [
      "additional_fields" .= additionalFields,
      "code" .= code,
      "components" .= components,
      "created_at" .= createdAt,
      "effective_tax_rate" .= effectiveTaxRate,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "name" .= name,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "status" .= status,
      "subsidiaries" .= subsidiaries,
      "total_tax_rate" .= totalTaxRate,
      "updated_at" .= updatedAt
    ]
