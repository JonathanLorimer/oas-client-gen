{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeletePurchaseOrderResponseResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncDeletePurchaseOrderResponseResponse1 (AsyncDeletePurchaseOrderResponseResponse1)
import Types.AsyncResponse36 (AsyncResponse36)

data AsyncDeletePurchaseOrderResponseResponse
  = AsyncDeletePurchaseOrderResponseResponseVariant1 AsyncDeletePurchaseOrderResponseResponse
  | AsyncDeletePurchaseOrderResponseResponseVariant2 AsyncDeletePurchaseOrderResponseResponse1
  deriving (Show, Eq)

instance FromJSON AsyncDeletePurchaseOrderResponseResponse where
  parseJSON value = asum
    [ AsyncDeletePurchaseOrderResponseResponseVariant1 <$> parseJSON value
    , AsyncDeletePurchaseOrderResponseResponseVariant2 <$> parseJSON value
    ]

instance ToJSON AsyncDeletePurchaseOrderResponseResponse where
  toJSON = \case
    AsyncDeletePurchaseOrderResponseResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    AsyncDeletePurchaseOrderResponseResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
