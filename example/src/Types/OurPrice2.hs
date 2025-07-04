{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OurPrice2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Schedule2 (Schedule2)

data OurPrice2 = OurPrice2
  { schedule :: [Schedule2]
  }
  deriving (Show, Eq)

instance FromJSON OurPrice2 where
  parseJSON = withObject "OurPrice2" $ \obj -> do
    schedule <- obj .: "schedule"
    pure $ OurPrice2{..}

instance ToJSON OurPrice2 where
  toJSON OurPrice2{..} =
    object [
      "schedule" .= schedule
    ]
