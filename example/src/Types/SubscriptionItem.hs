{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.SubscriptionItem where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data SubscriptionItem = SubscriptionItem
  { amount :: Maybe Double
  , interval :: Text
  , intervalCount :: Double
  , platformId :: Maybe Text
  , quantity :: Double
  , unitAmount :: Maybe Double
  }
  deriving (Show, Eq)

instance FromJSON SubscriptionItem where
  parseJSON = withObject "SubscriptionItem" $ \obj -> do
    amount <- obj .: "amount"
    interval <- obj .: "interval"
    intervalCount <- obj .: "interval_count"
    platformId <- obj .: "platform_id"
    quantity <- obj .: "quantity"
    unitAmount <- obj .: "unit_amount"
    pure $ SubscriptionItem{..}

instance ToJSON SubscriptionItem where
  toJSON SubscriptionItem{..} =
    object [
      "amount" .= amount,
      "interval" .= interval,
      "interval_count" .= intervalCount,
      "platform_id" .= platformId,
      "quantity" .= quantity,
      "unit_amount" .= unitAmount
    ]
