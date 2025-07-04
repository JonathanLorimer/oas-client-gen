{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OurPrice where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Schedule (Schedule)

data OurPrice = OurPrice
  { schedule :: [Schedule]
  }
  deriving (Show, Eq)

instance FromJSON OurPrice where
  parseJSON = withObject "OurPrice" $ \obj -> do
    schedule <- obj .: "schedule"
    pure $ OurPrice{..}

instance ToJSON OurPrice where
  toJSON OurPrice{..} =
    object [
      "schedule" .= schedule
    ]
