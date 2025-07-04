{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.SafetyAndCompliance4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data SafetyAndCompliance4 = SafetyAndCompliance4
  { countryOfOrigin :: Text
  , cpsiaCautionaryStatement :: Text
  , supplierDeclaredDgHzRegulation :: Text
  , warrantyDescription :: Text
  }
  deriving (Show, Eq)

instance FromJSON SafetyAndCompliance4 where
  parseJSON = withObject "SafetyAndCompliance4" $ \obj -> do
    countryOfOrigin <- obj .: "country_of_origin"
    cpsiaCautionaryStatement <- obj .: "cpsia_cautionary_statement"
    supplierDeclaredDgHzRegulation <- obj .: "supplier_declared_dg_hz_regulation"
    warrantyDescription <- obj .: "warranty_description"
    pure $ SafetyAndCompliance4{..}

instance ToJSON SafetyAndCompliance4 where
  toJSON SafetyAndCompliance4{..} =
    object [
      "country_of_origin" .= countryOfOrigin,
      "cpsia_cautionary_statement" .= cpsiaCautionaryStatement,
      "supplier_declared_dg_hz_regulation" .= supplierDeclaredDgHzRegulation,
      "warranty_description" .= warrantyDescription
    ]
