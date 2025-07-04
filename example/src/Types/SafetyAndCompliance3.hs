{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.SafetyAndCompliance3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data SafetyAndCompliance3 = SafetyAndCompliance3
  { batteriesRequired :: Text
  , containsLiquidContents :: Text
  , countryOfOrigin :: Text
  , cpsiaCautionaryStatement :: Text
  , supplierDeclaredDgHzRegulation :: Text
  }
  deriving (Show, Eq)

instance FromJSON SafetyAndCompliance3 where
  parseJSON = withObject "SafetyAndCompliance3" $ \obj -> do
    batteriesRequired <- obj .: "batteries_required"
    containsLiquidContents <- obj .: "contains_liquid_contents"
    countryOfOrigin <- obj .: "country_of_origin"
    cpsiaCautionaryStatement <- obj .: "cpsia_cautionary_statement"
    supplierDeclaredDgHzRegulation <- obj .: "supplier_declared_dg_hz_regulation"
    pure $ SafetyAndCompliance3{..}

instance ToJSON SafetyAndCompliance3 where
  toJSON SafetyAndCompliance3{..} =
    object [
      "batteries_required" .= batteriesRequired,
      "contains_liquid_contents" .= containsLiquidContents,
      "country_of_origin" .= countryOfOrigin,
      "cpsia_cautionary_statement" .= cpsiaCautionaryStatement,
      "supplier_declared_dg_hz_regulation" .= supplierDeclaredDgHzRegulation
    ]
