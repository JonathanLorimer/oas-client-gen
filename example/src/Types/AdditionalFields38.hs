{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields38 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields38 = AdditionalFields38
  { purchaseTotalTaxRate :: Maybe Double
  , salesTotalTaxRate :: Maybe Double
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields38 where
  parseJSON = withObject "AdditionalFields38" $ \obj -> do
    purchaseTotalTaxRate <- obj .: "purchase_total_tax_rate"
    salesTotalTaxRate <- obj .: "sales_total_tax_rate"
    pure $ AdditionalFields38{..}

instance ToJSON AdditionalFields38 where
  toJSON AdditionalFields38{..} =
    object [
      "purchase_total_tax_rate" .= purchaseTotalTaxRate,
      "sales_total_tax_rate" .= salesTotalTaxRate
    ]
