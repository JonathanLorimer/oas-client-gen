{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Schedule4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Schedule4 = Schedule4
  { valueWithTax :: Double
  }
  deriving (Show, Eq)

instance FromJSON Schedule4 where
  parseJSON = withObject "Schedule4" $ \obj -> do
    valueWithTax <- obj .: "value_with_tax"
    pure $ Schedule4{..}

instance ToJSON Schedule4 where
  toJSON Schedule4{..} =
    object [
      "value_with_tax" .= valueWithTax
    ]
