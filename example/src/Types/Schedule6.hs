{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Schedule6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Schedule6 = Schedule6
  { valueWithTax :: Double
  }
  deriving (Show, Eq)

instance FromJSON Schedule6 where
  parseJSON = withObject "Schedule6" $ \obj -> do
    valueWithTax <- obj .: "value_with_tax"
    pure $ Schedule6{..}

instance ToJSON Schedule6 where
  toJSON Schedule6{..} =
    object [
      "value_with_tax" .= valueWithTax
    ]
