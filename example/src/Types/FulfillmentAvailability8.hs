{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.FulfillmentAvailability8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data FulfillmentAvailability8 = FulfillmentAvailability8
  { fulfillmentChannelCode :: Text
  , quantity :: Int
  }
  deriving (Show, Eq)

instance FromJSON FulfillmentAvailability8 where
  parseJSON = withObject "FulfillmentAvailability8" $ \obj -> do
    fulfillmentChannelCode <- obj .: "fulfillment_channel_code"
    quantity <- obj .: "quantity"
    pure $ FulfillmentAvailability8{..}

instance ToJSON FulfillmentAvailability8 where
  toJSON FulfillmentAvailability8{..} =
    object [
      "fulfillment_channel_code" .= fulfillmentChannelCode,
      "quantity" .= quantity
    ]
