{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateOrderFulfillmentResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields43 (AdditionalFields43)
import Types.AsyncResponse40 (AsyncResponse40)
import Types.CreateOrderFulfillmentResponse1 (CreateOrderFulfillmentResponse1)
import Types.Fulfillment1 (Fulfillment1)
import Types.LineItems25 (LineItems25)

data CreateOrderFulfillmentResponse
  = CreateOrderFulfillmentResponseVariant1 CreateOrderFulfillmentResponse
  | CreateOrderFulfillmentResponseVariant2 CreateOrderFulfillmentResponse1
  deriving (Show, Eq)

instance FromJSON CreateOrderFulfillmentResponse where
  parseJSON value = asum
    [ CreateOrderFulfillmentResponseVariant1 <$> parseJSON value
    , CreateOrderFulfillmentResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateOrderFulfillmentResponse where
  toJSON = \case
    CreateOrderFulfillmentResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateOrderFulfillmentResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
