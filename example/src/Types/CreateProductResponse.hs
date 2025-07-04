{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateProductResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse41 (AsyncResponse41)
import Types.CreateProductResponse1 (CreateProductResponse1)

data CreateProductResponse
  = CreateProductResponseVariant1 CreateProductResponse
  | CreateProductResponseVariant2 CreateProductResponse1
  deriving (Show, Eq)

instance FromJSON CreateProductResponse where
  parseJSON value = asum
    [ CreateProductResponseVariant1 <$> parseJSON value
    , CreateProductResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateProductResponse where
  toJSON = \case
    CreateProductResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateProductResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
