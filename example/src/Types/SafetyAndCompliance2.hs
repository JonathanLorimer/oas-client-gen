{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.SafetyAndCompliance2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data SafetyAndCompliance2 = SafetyAndCompliance2
  { batteriesRequired :: Text
  , countryOfOrigin :: Text
  , cpsiaCautionaryStatement :: Text
  , supplierDeclaredDgHzRegulation :: Text
  }
  deriving (Show, Eq)

instance FromJSON SafetyAndCompliance2 where
  parseJSON = withObject "SafetyAndCompliance2" $ \obj -> do
    batteriesRequired <- obj .: "batteries_required"
    countryOfOrigin <- obj .: "country_of_origin"
    cpsiaCautionaryStatement <- obj .: "cpsia_cautionary_statement"
    supplierDeclaredDgHzRegulation <- obj .: "supplier_declared_dg_hz_regulation"
    pure $ SafetyAndCompliance2{..}

instance ToJSON SafetyAndCompliance2 where
  toJSON SafetyAndCompliance2{..} =
    object [
      "batteries_required" .= batteriesRequired,
      "country_of_origin" .= countryOfOrigin,
      "cpsia_cautionary_statement" .= cpsiaCautionaryStatement,
      "supplier_declared_dg_hz_regulation" .= supplierDeclaredDgHzRegulation
    ]
