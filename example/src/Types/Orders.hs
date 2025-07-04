{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Orders where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Orders
  = OrdersVariant1 Orders
  | OrdersVariant2 Text
  deriving (Show, Eq)

instance FromJSON Orders where
  parseJSON value = asum
    [ OrdersVariant1 <$> parseJSON value
    , OrdersVariant2 <$> parseJSON value
    ]

instance ToJSON Orders where
  toJSON = \case
    OrdersVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    OrdersVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
