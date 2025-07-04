{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OurPrice1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Schedule1 (Schedule1)

data OurPrice1 = OurPrice1
  { schedule :: [Schedule1]
  }
  deriving (Show, Eq)

instance FromJSON OurPrice1 where
  parseJSON = withObject "OurPrice1" $ \obj -> do
    schedule <- obj .: "schedule"
    pure $ OurPrice1{..}

instance ToJSON OurPrice1 where
  toJSON OurPrice1{..} =
    object [
      "schedule" .= schedule
    ]
