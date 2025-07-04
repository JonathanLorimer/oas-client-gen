{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.FulfillmentAvailability where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data FulfillmentAvailability = FulfillmentAvailability
  { fulfillmentChannelCode :: Text
  , quantity :: Int
  }
  deriving (Show, Eq)

instance FromJSON FulfillmentAvailability where
  parseJSON = withObject "FulfillmentAvailability" $ \obj -> do
    fulfillmentChannelCode <- obj .: "fulfillment_channel_code"
    quantity <- obj .: "quantity"
    pure $ FulfillmentAvailability{..}

instance ToJSON FulfillmentAvailability where
  toJSON FulfillmentAvailability{..} =
    object [
      "fulfillment_channel_code" .= fulfillmentChannelCode,
      "quantity" .= quantity
    ]
