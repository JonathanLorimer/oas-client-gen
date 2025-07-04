{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Status_1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Status_1
  = Status_1Variant1 Text
  | Status_1Variant2 Text
  deriving (Show, Eq)

instance FromJSON Status_1 where
  parseJSON value = asum
    [ Status_1Variant1 <$> parseJSON value
    , Status_1Variant2 <$> parseJSON value
    ]

instance ToJSON Status_1 where
  toJSON = \case
    Status_1Variant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    Status_1Variant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
