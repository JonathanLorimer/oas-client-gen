{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields27 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields27 = AdditionalFields27
  { revRecEndDate :: Text
  , revRecStartDate :: Text
  , serviceDate :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields27 where
  parseJSON = withObject "AdditionalFields27" $ \obj -> do
    revRecEndDate <- obj .: "rev_rec_end_date"
    revRecStartDate <- obj .: "rev_rec_start_date"
    serviceDate <- obj .: "service_date"
    pure $ AdditionalFields27{..}

instance ToJSON AdditionalFields27 where
  toJSON AdditionalFields27{..} =
    object [
      "rev_rec_end_date" .= revRecEndDate,
      "rev_rec_start_date" .= revRecStartDate,
      "service_date" .= serviceDate
    ]
