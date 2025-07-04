{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateOrderBody where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields41 (AdditionalFields41)
import Types.BillingAddress (BillingAddress)
import Types.Customer1 (Customer1)
import Types.LineItems23 (LineItems23)
import Types.Order (Order)
import Types.ShippingAddress (ShippingAddress)

data CreateOrderBody = CreateOrderBody
  { order :: Order
  }
  deriving (Show, Eq)

instance FromJSON CreateOrderBody where
  parseJSON = withObject "CreateOrderBody" $ \obj -> do
    order <- obj .: "order"
    pure $ CreateOrderBody{..}

instance ToJSON CreateOrderBody where
  toJSON CreateOrderBody{..} =
    object [
      "order" .= order
    ]
