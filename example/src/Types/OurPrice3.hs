{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OurPrice3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Schedule3 (Schedule3)

data OurPrice3 = OurPrice3
  { schedule :: [Schedule3]
  }
  deriving (Show, Eq)

instance FromJSON OurPrice3 where
  parseJSON = withObject "OurPrice3" $ \obj -> do
    schedule <- obj .: "schedule"
    pure $ OurPrice3{..}

instance ToJSON OurPrice3 where
  toJSON OurPrice3{..} =
    object [
      "schedule" .= schedule
    ]
