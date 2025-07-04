{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.FulfillmentAvailability3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data FulfillmentAvailability3 = FulfillmentAvailability3
  { fulfillmentChannelCode :: Text
  , quantity :: Int
  }
  deriving (Show, Eq)

instance FromJSON FulfillmentAvailability3 where
  parseJSON = withObject "FulfillmentAvailability3" $ \obj -> do
    fulfillmentChannelCode <- obj .: "fulfillment_channel_code"
    quantity <- obj .: "quantity"
    pure $ FulfillmentAvailability3{..}

instance ToJSON FulfillmentAvailability3 where
  toJSON FulfillmentAvailability3{..} =
    object [
      "fulfillment_channel_code" .= fulfillmentChannelCode,
      "quantity" .= quantity
    ]
