{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields8 = AdditionalFields8
  { autoExchangeRate :: Bool
  , locationId :: Text
  , reconciled :: Bool
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields8 where
  parseJSON = withObject "AdditionalFields8" $ \obj -> do
    autoExchangeRate <- obj .: "auto_exchange_rate"
    locationId <- obj .: "location_id"
    reconciled <- obj .: "reconciled"
    pure $ AdditionalFields8{..}

instance ToJSON AdditionalFields8 where
  toJSON AdditionalFields8{..} =
    object [
      "auto_exchange_rate" .= autoExchangeRate,
      "location_id" .= locationId,
      "reconciled" .= reconciled
    ]
