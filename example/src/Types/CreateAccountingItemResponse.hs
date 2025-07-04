{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateAccountingItemResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse30 (AsyncResponse30)
import Types.CreateAccountingItemResponse1 (CreateAccountingItemResponse1)

data CreateAccountingItemResponse
  = CreateAccountingItemResponseVariant1 CreateAccountingItemResponse
  | CreateAccountingItemResponseVariant2 CreateAccountingItemResponse1
  deriving (Show, Eq)

instance FromJSON CreateAccountingItemResponse where
  parseJSON value = asum
    [ CreateAccountingItemResponseVariant1 <$> parseJSON value
    , CreateAccountingItemResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateAccountingItemResponse where
  toJSON = \case
    CreateAccountingItemResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateAccountingItemResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
