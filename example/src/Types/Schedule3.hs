{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Schedule3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Schedule3 = Schedule3
  { valueWithTax :: Double
  }
  deriving (Show, Eq)

instance FromJSON Schedule3 where
  parseJSON = withObject "Schedule3" $ \obj -> do
    valueWithTax <- obj .: "value_with_tax"
    pure $ Schedule3{..}

instance ToJSON Schedule3 where
  toJSON Schedule3{..} =
    object [
      "value_with_tax" .= valueWithTax
    ]
