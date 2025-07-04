{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields21 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields21 = AdditionalFields21
  { revRecEndDate :: Text
  , revRecStartDate :: Text
  , serviceDate :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields21 where
  parseJSON = withObject "AdditionalFields21" $ \obj -> do
    revRecEndDate <- obj .: "rev_rec_end_date"
    revRecStartDate <- obj .: "rev_rec_start_date"
    serviceDate <- obj .: "service_date"
    pure $ AdditionalFields21{..}

instance ToJSON AdditionalFields21 where
  toJSON AdditionalFields21{..} =
    object [
      "rev_rec_end_date" .= revRecEndDate,
      "rev_rec_start_date" .= revRecStartDate,
      "service_date" .= serviceDate
    ]
