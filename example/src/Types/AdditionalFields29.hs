{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields29 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.LinkedSalesOrder (LinkedSalesOrder)

data AdditionalFields29 = AdditionalFields29
  { discountPercentage :: Double
  , linkedSalesOrder :: LinkedSalesOrder
  , revRecEndDate :: Text
  , revRecStartDate :: Text
  , salesTaxable :: Bool
  , serviceDate :: Text
  , taxAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields29 where
  parseJSON = withObject "AdditionalFields29" $ \obj -> do
    discountPercentage <- obj .: "discount_percentage"
    linkedSalesOrder <- obj .: "linked_sales_order"
    revRecEndDate <- obj .: "rev_rec_end_date"
    revRecStartDate <- obj .: "rev_rec_start_date"
    salesTaxable <- obj .: "sales_taxable"
    serviceDate <- obj .: "service_date"
    taxAmount <- obj .: "tax_amount"
    pure $ AdditionalFields29{..}

instance ToJSON AdditionalFields29 where
  toJSON AdditionalFields29{..} =
    object [
      "discount_percentage" .= discountPercentage,
      "linked_sales_order" .= linkedSalesOrder,
      "rev_rec_end_date" .= revRecEndDate,
      "rev_rec_start_date" .= revRecStartDate,
      "sales_taxable" .= salesTaxable,
      "service_date" .= serviceDate,
      "tax_amount" .= taxAmount
    ]
