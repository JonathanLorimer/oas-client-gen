{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Schedule7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Schedule7 = Schedule7
  { valueWithTax :: Double
  }
  deriving (Show, Eq)

instance FromJSON Schedule7 where
  parseJSON = withObject "Schedule7" $ \obj -> do
    valueWithTax <- obj .: "value_with_tax"
    pure $ Schedule7{..}

instance ToJSON Schedule7 where
  toJSON Schedule7{..} =
    object [
      "value_with_tax" .= valueWithTax
    ]
