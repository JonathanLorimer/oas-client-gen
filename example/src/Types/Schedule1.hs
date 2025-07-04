{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Schedule1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Schedule1 = Schedule1
  { valueWithTax :: Double
  }
  deriving (Show, Eq)

instance FromJSON Schedule1 where
  parseJSON = withObject "Schedule1" $ \obj -> do
    valueWithTax <- obj .: "value_with_tax"
    pure $ Schedule1{..}

instance ToJSON Schedule1 where
  toJSON Schedule1{..} =
    object [
      "value_with_tax" .= valueWithTax
    ]
