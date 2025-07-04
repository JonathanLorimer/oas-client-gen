{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OurPrice6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Schedule6 (Schedule6)

data OurPrice6 = OurPrice6
  { schedule :: [Schedule6]
  }
  deriving (Show, Eq)

instance FromJSON OurPrice6 where
  parseJSON = withObject "OurPrice6" $ \obj -> do
    schedule <- obj .: "schedule"
    pure $ OurPrice6{..}

instance ToJSON OurPrice6 where
  toJSON OurPrice6{..} =
    object [
      "schedule" .= schedule
    ]
