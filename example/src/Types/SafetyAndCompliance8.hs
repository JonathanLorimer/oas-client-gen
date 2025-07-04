{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.SafetyAndCompliance8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data SafetyAndCompliance8 = SafetyAndCompliance8
  { batteriesRequired :: Text
  , countryOfOrigin :: Text
  , supplierDeclaredDgHzRegulation :: Text
  }
  deriving (Show, Eq)

instance FromJSON SafetyAndCompliance8 where
  parseJSON = withObject "SafetyAndCompliance8" $ \obj -> do
    batteriesRequired <- obj .: "batteries_required"
    countryOfOrigin <- obj .: "country_of_origin"
    supplierDeclaredDgHzRegulation <- obj .: "supplier_declared_dg_hz_regulation"
    pure $ SafetyAndCompliance8{..}

instance ToJSON SafetyAndCompliance8 where
  toJSON SafetyAndCompliance8{..} =
    object [
      "batteries_required" .= batteriesRequired,
      "country_of_origin" .= countryOfOrigin,
      "supplier_declared_dg_hz_regulation" .= supplierDeclaredDgHzRegulation
    ]
