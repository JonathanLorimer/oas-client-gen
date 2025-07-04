{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.FulfillmentAvailability1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data FulfillmentAvailability1 = FulfillmentAvailability1
  { fulfillmentChannelCode :: Text
  , quantity :: Int
  }
  deriving (Show, Eq)

instance FromJSON FulfillmentAvailability1 where
  parseJSON = withObject "FulfillmentAvailability1" $ \obj -> do
    fulfillmentChannelCode <- obj .: "fulfillment_channel_code"
    quantity <- obj .: "quantity"
    pure $ FulfillmentAvailability1{..}

instance ToJSON FulfillmentAvailability1 where
  toJSON FulfillmentAvailability1{..} =
    object [
      "fulfillment_channel_code" .= fulfillmentChannelCode,
      "quantity" .= quantity
    ]
