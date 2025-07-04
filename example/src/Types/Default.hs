{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Default where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Default
  = DefaultVariant1 Default
  | DefaultVariant2 Double
  deriving (Show, Eq)

instance FromJSON Default where
  parseJSON value = asum
    [ DefaultVariant1 <$> parseJSON value
    , DefaultVariant2 <$> parseJSON value
    ]

instance ToJSON Default where
  toJSON = \case
    DefaultVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    DefaultVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
