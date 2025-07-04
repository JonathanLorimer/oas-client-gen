{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Schedule where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Schedule = Schedule
  { valueWithTax :: Double
  }
  deriving (Show, Eq)

instance FromJSON Schedule where
  parseJSON = withObject "Schedule" $ \obj -> do
    valueWithTax <- obj .: "value_with_tax"
    pure $ Schedule{..}

instance ToJSON Schedule where
  toJSON Schedule{..} =
    object [
      "value_with_tax" .= valueWithTax
    ]
