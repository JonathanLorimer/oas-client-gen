{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Order where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields41 (AdditionalFields41)
import Types.BillingAddress (BillingAddress)
import Types.Customer1 (Customer1)
import Types.LineItems23 (LineItems23)
import Types.ShippingAddress (ShippingAddress)

data Order = Order
  { additionalFields :: AdditionalFields41
  , billingAddress :: BillingAddress
  , currencyCode :: Text
  , customer :: Customer1
  , lineItems :: [LineItems23]
  , shippingAddress :: ShippingAddress
  }
  deriving (Show, Eq)

instance FromJSON Order where
  parseJSON = withObject "Order" $ \obj -> do
    additionalFields <- obj .: "additional_fields"
    billingAddress <- obj .: "billing_address"
    currencyCode <- obj .: "currency_code"
    customer <- obj .: "customer"
    lineItems <- obj .: "line_items"
    shippingAddress <- obj .: "shipping_address"
    pure $ Order{..}

instance ToJSON Order where
  toJSON Order{..} =
    object [
      "additional_fields" .= additionalFields,
      "billing_address" .= billingAddress,
      "currency_code" .= currencyCode,
      "customer" .= customer,
      "line_items" .= lineItems,
      "shipping_address" .= shippingAddress
    ]
