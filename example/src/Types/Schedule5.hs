{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Schedule5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Schedule5 = Schedule5
  { valueWithTax :: Double
  }
  deriving (Show, Eq)

instance FromJSON Schedule5 where
  parseJSON = withObject "Schedule5" $ \obj -> do
    valueWithTax <- obj .: "value_with_tax"
    pure $ Schedule5{..}

instance ToJSON Schedule5 where
  toJSON Schedule5{..} =
    object [
      "value_with_tax" .= valueWithTax
    ]
