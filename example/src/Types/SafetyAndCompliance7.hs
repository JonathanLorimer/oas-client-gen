{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.SafetyAndCompliance7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data SafetyAndCompliance7 = SafetyAndCompliance7
  { batteriesRequired :: Text
  , countryOfOrigin :: Text
  , cpsiaCautionaryStatement :: Text
  , inner :: Text
  , outer :: Text
  , supplierDeclaredDgHzRegulation :: Text
  }
  deriving (Show, Eq)

instance FromJSON SafetyAndCompliance7 where
  parseJSON = withObject "SafetyAndCompliance7" $ \obj -> do
    batteriesRequired <- obj .: "batteries_required"
    countryOfOrigin <- obj .: "country_of_origin"
    cpsiaCautionaryStatement <- obj .: "cpsia_cautionary_statement"
    inner <- obj .: "inner"
    outer <- obj .: "outer"
    supplierDeclaredDgHzRegulation <- obj .: "supplier_declared_dg_hz_regulation"
    pure $ SafetyAndCompliance7{..}

instance ToJSON SafetyAndCompliance7 where
  toJSON SafetyAndCompliance7{..} =
    object [
      "batteries_required" .= batteriesRequired,
      "country_of_origin" .= countryOfOrigin,
      "cpsia_cautionary_statement" .= cpsiaCautionaryStatement,
      "inner" .= inner,
      "outer" .= outer,
      "supplier_declared_dg_hz_regulation" .= supplierDeclaredDgHzRegulation
    ]
