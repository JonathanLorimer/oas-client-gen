{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.SafetyAndCompliance6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data SafetyAndCompliance6 = SafetyAndCompliance6
  { batteriesRequired :: Text
  , countryOfOrigin :: Text
  , cpsiaCautionaryStatement :: Text
  , supplierDeclaredDgHzRegulation :: Text
  }
  deriving (Show, Eq)

instance FromJSON SafetyAndCompliance6 where
  parseJSON = withObject "SafetyAndCompliance6" $ \obj -> do
    batteriesRequired <- obj .: "batteries_required"
    countryOfOrigin <- obj .: "country_of_origin"
    cpsiaCautionaryStatement <- obj .: "cpsia_cautionary_statement"
    supplierDeclaredDgHzRegulation <- obj .: "supplier_declared_dg_hz_regulation"
    pure $ SafetyAndCompliance6{..}

instance ToJSON SafetyAndCompliance6 where
  toJSON SafetyAndCompliance6{..} =
    object [
      "batteries_required" .= batteriesRequired,
      "country_of_origin" .= countryOfOrigin,
      "cpsia_cautionary_statement" .= cpsiaCautionaryStatement,
      "supplier_declared_dg_hz_regulation" .= supplierDeclaredDgHzRegulation
    ]
