{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Fulfillment where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields42 (AdditionalFields42)
import Types.LineItems24 (LineItems24)

data Fulfillment = Fulfillment
  { additionalFields :: AdditionalFields42
  , carrier :: Text
  , lineItems :: [LineItems24]
  , locationId :: Text
  , service :: Text
  , trackingNumber :: Text
  , trackingUrl :: Text
  }
  deriving (Show, Eq)

instance FromJSON Fulfillment where
  parseJSON = withObject "Fulfillment" $ \obj -> do
    additionalFields <- obj .: "additional_fields"
    carrier <- obj .: "carrier"
    lineItems <- obj .: "line_items"
    locationId <- obj .: "location_id"
    service <- obj .: "service"
    trackingNumber <- obj .: "tracking_number"
    trackingUrl <- obj .: "tracking_url"
    pure $ Fulfillment{..}

instance ToJSON Fulfillment where
  toJSON Fulfillment{..} =
    object [
      "additional_fields" .= additionalFields,
      "carrier" .= carrier,
      "line_items" .= lineItems,
      "location_id" .= locationId,
      "service" .= service,
      "tracking_number" .= trackingNumber,
      "tracking_url" .= trackingUrl
    ]
