{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateOrderFulfillmentBody where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields42 (AdditionalFields42)
import Types.Fulfillment (Fulfillment)
import Types.LineItems24 (LineItems24)

data CreateOrderFulfillmentBody = CreateOrderFulfillmentBody
  { fulfillment :: Fulfillment
  }
  deriving (Show, Eq)

instance FromJSON CreateOrderFulfillmentBody where
  parseJSON = withObject "CreateOrderFulfillmentBody" $ \obj -> do
    fulfillment <- obj .: "fulfillment"
    pure $ CreateOrderFulfillmentBody{..}

instance ToJSON CreateOrderFulfillmentBody where
  toJSON CreateOrderFulfillmentBody{..} =
    object [
      "fulfillment" .= fulfillment
    ]
