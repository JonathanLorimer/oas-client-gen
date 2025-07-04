{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateTaxRateRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields39 (AdditionalFields39)
import Types.Components1 (Components1)
import Types.CreateTaxRate (CreateTaxRate)

data CreateCreateTaxRateRequest = CreateCreateTaxRateRequest
  { responseMode :: Text
  , taxRate :: CreateTaxRate
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateTaxRateRequest where
  parseJSON = withObject "CreateCreateTaxRateRequest" $ \obj -> do
    responseMode <- obj .: "response_mode"
    taxRate <- obj .: "tax_rate"
    pure $ CreateCreateTaxRateRequest{..}

instance ToJSON CreateCreateTaxRateRequest where
  toJSON CreateCreateTaxRateRequest{..} =
    object [
      "response_mode" .= responseMode,
      "tax_rate" .= taxRate
    ]
