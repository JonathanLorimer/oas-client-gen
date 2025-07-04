{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Products where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Variants (Variants)

data Products
  = ProductsVariant1 Products
  | ProductsVariant2 Text
  deriving (Show, Eq)

instance FromJSON Products where
  parseJSON value = asum
    [ ProductsVariant1 <$> parseJSON value
    , ProductsVariant2 <$> parseJSON value
    ]

instance ToJSON Products where
  toJSON = \case
    ProductsVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    ProductsVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
