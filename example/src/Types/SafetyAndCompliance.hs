{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.SafetyAndCompliance where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data SafetyAndCompliance = SafetyAndCompliance
  { batteriesRequired :: Text
  , countryOfOrigin :: Text
  , cpsiaCautionaryStatement :: Text
  , supplierDeclaredDgHzRegulation :: Text
  , warrantyDescription :: Text
  }
  deriving (Show, Eq)

instance FromJSON SafetyAndCompliance where
  parseJSON = withObject "SafetyAndCompliance" $ \obj -> do
    batteriesRequired <- obj .: "batteries_required"
    countryOfOrigin <- obj .: "country_of_origin"
    cpsiaCautionaryStatement <- obj .: "cpsia_cautionary_statement"
    supplierDeclaredDgHzRegulation <- obj .: "supplier_declared_dg_hz_regulation"
    warrantyDescription <- obj .: "warranty_description"
    pure $ SafetyAndCompliance{..}

instance ToJSON SafetyAndCompliance where
  toJSON SafetyAndCompliance{..} =
    object [
      "batteries_required" .= batteriesRequired,
      "country_of_origin" .= countryOfOrigin,
      "cpsia_cautionary_statement" .= cpsiaCautionaryStatement,
      "supplier_declared_dg_hz_regulation" .= supplierDeclaredDgHzRegulation,
      "warranty_description" .= warrantyDescription
    ]
