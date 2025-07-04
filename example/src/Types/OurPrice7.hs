{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OurPrice7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Schedule7 (Schedule7)

data OurPrice7 = OurPrice7
  { schedule :: [Schedule7]
  }
  deriving (Show, Eq)

instance FromJSON OurPrice7 where
  parseJSON = withObject "OurPrice7" $ \obj -> do
    schedule <- obj .: "schedule"
    pure $ OurPrice7{..}

instance ToJSON OurPrice7 where
  toJSON OurPrice7{..} =
    object [
      "schedule" .= schedule
    ]
