{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteItemResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncDeleteItemResponse1 (AsyncDeleteItemResponse1)
import Types.AsyncResponse31 (AsyncResponse31)

data AsyncDeleteItemResponse
  = AsyncDeleteItemResponseVariant1 AsyncDeleteItemResponse
  | AsyncDeleteItemResponseVariant2 AsyncDeleteItemResponse1
  deriving (Show, Eq)

instance FromJSON AsyncDeleteItemResponse where
  parseJSON value = asum
    [ AsyncDeleteItemResponseVariant1 <$> parseJSON value
    , AsyncDeleteItemResponseVariant2 <$> parseJSON value
    ]

instance ToJSON AsyncDeleteItemResponse where
  toJSON = \case
    AsyncDeleteItemResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    AsyncDeleteItemResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
