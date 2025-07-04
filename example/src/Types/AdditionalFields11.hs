{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields11 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields11 = AdditionalFields11
  { autoExchangeRate :: Bool
  , classId :: Text
  , departmentId :: Text
  , locationId :: Text
  , reference :: Text
  , taxInclusive :: Bool
  , taxRatePercent :: Double
  , transactionDate :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields11 where
  parseJSON = withObject "AdditionalFields11" $ \obj -> do
    autoExchangeRate <- obj .: "auto_exchange_rate"
    classId <- obj .: "class_id"
    departmentId <- obj .: "department_id"
    locationId <- obj .: "location_id"
    reference <- obj .: "reference"
    taxInclusive <- obj .: "tax_inclusive"
    taxRatePercent <- obj .: "tax_rate_percent"
    transactionDate <- obj .: "transaction_date"
    pure $ AdditionalFields11{..}

instance ToJSON AdditionalFields11 where
  toJSON AdditionalFields11{..} =
    object [
      "auto_exchange_rate" .= autoExchangeRate,
      "class_id" .= classId,
      "department_id" .= departmentId,
      "location_id" .= locationId,
      "reference" .= reference,
      "tax_inclusive" .= taxInclusive,
      "tax_rate_percent" .= taxRatePercent,
      "transaction_date" .= transactionDate
    ]
