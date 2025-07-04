{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeletePaymentTermResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncDeletePaymentTermResponse1 (AsyncDeletePaymentTermResponse1)
import Types.AsyncResponse34 (AsyncResponse34)

data AsyncDeletePaymentTermResponse
  = AsyncDeletePaymentTermResponseVariant1 AsyncDeletePaymentTermResponse
  | AsyncDeletePaymentTermResponseVariant2 AsyncDeletePaymentTermResponse1
  deriving (Show, Eq)

instance FromJSON AsyncDeletePaymentTermResponse where
  parseJSON value = asum
    [ AsyncDeletePaymentTermResponseVariant1 <$> parseJSON value
    , AsyncDeletePaymentTermResponseVariant2 <$> parseJSON value
    ]

instance ToJSON AsyncDeletePaymentTermResponse where
  toJSON = \case
    AsyncDeletePaymentTermResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    AsyncDeletePaymentTermResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
