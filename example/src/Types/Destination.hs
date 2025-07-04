{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Destination where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Destination = Destination
  { accountNumberLastDigits :: Maybe Text
  , bankName :: Maybe Text
  , brand :: Maybe Text
  , destinationId :: Maybe Text
  , lastFour :: Maybe Text
  , routingNumber :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Destination where
  parseJSON = withObject "Destination" $ \obj -> do
    accountNumberLastDigits <- obj .: "account_number_last_digits"
    bankName <- obj .: "bank_name"
    brand <- obj .: "brand"
    destinationId <- obj .: "destination_id"
    lastFour <- obj .: "last_four"
    routingNumber <- obj .: "routing_number"
    pure $ Destination{..}

instance ToJSON Destination where
  toJSON Destination{..} =
    object [
      "account_number_last_digits" .= accountNumberLastDigits,
      "bank_name" .= bankName,
      "brand" .= brand,
      "destination_id" .= destinationId,
      "last_four" .= lastFour,
      "routing_number" .= routingNumber
    ]
