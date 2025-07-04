{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateSalesOrderResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse37 (AsyncResponse37)
import Types.CreateSalesOrderResponse1 (CreateSalesOrderResponse1)

data CreateSalesOrderResponse
  = CreateSalesOrderResponseVariant1 CreateSalesOrderResponse
  | CreateSalesOrderResponseVariant2 CreateSalesOrderResponse1
  deriving (Show, Eq)

instance FromJSON CreateSalesOrderResponse where
  parseJSON value = asum
    [ CreateSalesOrderResponseVariant1 <$> parseJSON value
    , CreateSalesOrderResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateSalesOrderResponse where
  toJSON = \case
    CreateSalesOrderResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateSalesOrderResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
