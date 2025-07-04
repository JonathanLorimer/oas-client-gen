{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Schedule2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Schedule2 = Schedule2
  { valueWithTax :: Double
  }
  deriving (Show, Eq)

instance FromJSON Schedule2 where
  parseJSON = withObject "Schedule2" $ \obj -> do
    valueWithTax <- obj .: "value_with_tax"
    pure $ Schedule2{..}

instance ToJSON Schedule2 where
  toJSON Schedule2{..} =
    object [
      "value_with_tax" .= valueWithTax
    ]
