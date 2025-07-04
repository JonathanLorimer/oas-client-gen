{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OurPrice8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Schedule8 (Schedule8)

data OurPrice8 = OurPrice8
  { schedule :: [Schedule8]
  }
  deriving (Show, Eq)

instance FromJSON OurPrice8 where
  parseJSON = withObject "OurPrice8" $ \obj -> do
    schedule <- obj .: "schedule"
    pure $ OurPrice8{..}

instance ToJSON OurPrice8 where
  toJSON OurPrice8{..} =
    object [
      "schedule" .= schedule
    ]
