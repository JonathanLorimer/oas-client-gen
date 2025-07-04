{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields19 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields19 = AdditionalFields19
  { autoExchangeRate :: Bool
  , billable :: Bool
  , departmentId :: Text
  , isReconciled :: Bool
  , journalType :: Text
  , locationId :: Text
  , placeOfSupply :: Text
  , projectId :: Text
  , referenceNumber :: Text
  , taxInclusive :: Bool
  , taxRateId :: Text
  , taxTreatment :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields19 where
  parseJSON = withObject "AdditionalFields19" $ \obj -> do
    autoExchangeRate <- obj .: "auto_exchange_rate"
    billable <- obj .: "billable"
    departmentId <- obj .: "department_id"
    isReconciled <- obj .: "is_reconciled"
    journalType <- obj .: "journal_type"
    locationId <- obj .: "location_id"
    placeOfSupply <- obj .: "place_of_supply"
    projectId <- obj .: "project_id"
    referenceNumber <- obj .: "reference_number"
    taxInclusive <- obj .: "tax_inclusive"
    taxRateId <- obj .: "tax_rate_id"
    taxTreatment <- obj .: "tax_treatment"
    pure $ AdditionalFields19{..}

instance ToJSON AdditionalFields19 where
  toJSON AdditionalFields19{..} =
    object [
      "auto_exchange_rate" .= autoExchangeRate,
      "billable" .= billable,
      "department_id" .= departmentId,
      "is_reconciled" .= isReconciled,
      "journal_type" .= journalType,
      "location_id" .= locationId,
      "place_of_supply" .= placeOfSupply,
      "project_id" .= projectId,
      "reference_number" .= referenceNumber,
      "tax_inclusive" .= taxInclusive,
      "tax_rate_id" .= taxRateId,
      "tax_treatment" .= taxTreatment
    ]
