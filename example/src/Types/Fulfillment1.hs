{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Fulfillment1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields43 (AdditionalFields43)
import Types.LineItems25 (LineItems25)

data Fulfillment1 = Fulfillment1
  { carrier :: Maybe Text
  , id :: Text
  , lineItems :: [LineItems25]
  , orderId :: Text
  , service :: Maybe Text
  , trackingNumber :: Maybe Text
  , trackingUrl :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Fulfillment1 where
  parseJSON = withObject "Fulfillment1" $ \obj -> do
    carrier <- obj .: "carrier"
    id <- obj .: "id"
    lineItems <- obj .: "line_items"
    orderId <- obj .: "order_id"
    service <- obj .: "service"
    trackingNumber <- obj .: "tracking_number"
    trackingUrl <- obj .: "tracking_url"
    pure $ Fulfillment1{..}

instance ToJSON Fulfillment1 where
  toJSON Fulfillment1{..} =
    object [
      "carrier" .= carrier,
      "id" .= id,
      "line_items" .= lineItems,
      "order_id" .= orderId,
      "service" .= service,
      "tracking_number" .= trackingNumber,
      "tracking_url" .= trackingUrl
    ]
