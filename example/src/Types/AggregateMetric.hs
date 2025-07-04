{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AggregateMetric where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AggregateMetric = AggregateMetric
  { currency :: Text
  , endDate :: Text
  , startDate :: Text
  , value :: Text
  }
  deriving (Show, Eq)

instance FromJSON AggregateMetric where
  parseJSON = withObject "AggregateMetric" $ \obj -> do
    currency <- obj .: "currency"
    endDate <- obj .: "end_date"
    startDate <- obj .: "start_date"
    value <- obj .: "value"
    pure $ AggregateMetric{..}

instance ToJSON AggregateMetric where
  toJSON AggregateMetric{..} =
    object [
      "currency" .= currency,
      "end_date" .= endDate,
      "start_date" .= startDate,
      "value" .= value
    ]
