{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OurPrice4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Schedule4 (Schedule4)

data OurPrice4 = OurPrice4
  { schedule :: [Schedule4]
  }
  deriving (Show, Eq)

instance FromJSON OurPrice4 where
  parseJSON = withObject "OurPrice4" $ \obj -> do
    schedule <- obj .: "schedule"
    pure $ OurPrice4{..}

instance ToJSON OurPrice4 where
  toJSON OurPrice4{..} =
    object [
      "schedule" .= schedule
    ]
