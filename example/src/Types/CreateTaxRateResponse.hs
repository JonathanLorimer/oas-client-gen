{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateTaxRateResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse38 (AsyncResponse38)
import Types.CreateTaxRateResponse1 (CreateTaxRateResponse1)

data CreateTaxRateResponse
  = CreateTaxRateResponseVariant1 CreateTaxRateResponse
  | CreateTaxRateResponseVariant2 CreateTaxRateResponse1
  deriving (Show, Eq)

instance FromJSON CreateTaxRateResponse where
  parseJSON value = asum
    [ CreateTaxRateResponseVariant1 <$> parseJSON value
    , CreateTaxRateResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateTaxRateResponse where
  toJSON = \case
    CreateTaxRateResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateTaxRateResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
