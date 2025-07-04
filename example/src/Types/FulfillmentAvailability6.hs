{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.FulfillmentAvailability6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data FulfillmentAvailability6 = FulfillmentAvailability6
  { fulfillmentChannelCode :: Text
  , quantity :: Int
  }
  deriving (Show, Eq)

instance FromJSON FulfillmentAvailability6 where
  parseJSON = withObject "FulfillmentAvailability6" $ \obj -> do
    fulfillmentChannelCode <- obj .: "fulfillment_channel_code"
    quantity <- obj .: "quantity"
    pure $ FulfillmentAvailability6{..}

instance ToJSON FulfillmentAvailability6 where
  toJSON FulfillmentAvailability6{..} =
    object [
      "fulfillment_channel_code" .= fulfillmentChannelCode,
      "quantity" .= quantity
    ]
