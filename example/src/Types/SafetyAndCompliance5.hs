{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.SafetyAndCompliance5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data SafetyAndCompliance5 = SafetyAndCompliance5
  { batteriesRequired :: Text
  , countryOfOrigin :: Text
  , cpsiaCautionaryStatement :: Text
  , supplierDeclaredDgHzRegulation :: Text
  , supplierDeclaredMaterialRegulation :: Text
  }
  deriving (Show, Eq)

instance FromJSON SafetyAndCompliance5 where
  parseJSON = withObject "SafetyAndCompliance5" $ \obj -> do
    batteriesRequired <- obj .: "batteries_required"
    countryOfOrigin <- obj .: "country_of_origin"
    cpsiaCautionaryStatement <- obj .: "cpsia_cautionary_statement"
    supplierDeclaredDgHzRegulation <- obj .: "supplier_declared_dg_hz_regulation"
    supplierDeclaredMaterialRegulation <- obj .: "supplier_declared_material_regulation"
    pure $ SafetyAndCompliance5{..}

instance ToJSON SafetyAndCompliance5 where
  toJSON SafetyAndCompliance5{..} =
    object [
      "batteries_required" .= batteriesRequired,
      "country_of_origin" .= countryOfOrigin,
      "cpsia_cautionary_statement" .= cpsiaCautionaryStatement,
      "supplier_declared_dg_hz_regulation" .= supplierDeclaredDgHzRegulation,
      "supplier_declared_material_regulation" .= supplierDeclaredMaterialRegulation
    ]
