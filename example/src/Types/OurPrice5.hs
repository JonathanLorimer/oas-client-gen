{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OurPrice5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Schedule5 (Schedule5)

data OurPrice5 = OurPrice5
  { schedule :: [Schedule5]
  }
  deriving (Show, Eq)

instance FromJSON OurPrice5 where
  parseJSON = withObject "OurPrice5" $ \obj -> do
    schedule <- obj .: "schedule"
    pure $ OurPrice5{..}

instance ToJSON OurPrice5 where
  toJSON OurPrice5{..} =
    object [
      "schedule" .= schedule
    ]
