{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Schedule8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Schedule8 = Schedule8
  { valueWithTax :: Double
  }
  deriving (Show, Eq)

instance FromJSON Schedule8 where
  parseJSON = withObject "Schedule8" $ \obj -> do
    valueWithTax <- obj .: "value_with_tax"
    pure $ Schedule8{..}

instance ToJSON Schedule8 where
  toJSON Schedule8{..} =
    object [
      "value_with_tax" .= valueWithTax
    ]
