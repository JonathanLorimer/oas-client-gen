{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields22 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields22 = AdditionalFields22
  { locationId :: Text
  , taxInclusive :: Bool
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields22 where
  parseJSON = withObject "AdditionalFields22" $ \obj -> do
    locationId <- obj .: "location_id"
    taxInclusive <- obj .: "tax_inclusive"
    pure $ AdditionalFields22{..}

instance ToJSON AdditionalFields22 where
  toJSON AdditionalFields22{..} =
    object [
      "location_id" .= locationId,
      "tax_inclusive" .= taxInclusive
    ]
