{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreatePurchaseOrder20230207Response where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AsyncResponse35 (AsyncResponse35)
import Types.CreatePurchaseOrder20230207Response1 (CreatePurchaseOrder20230207Response1)
import Types.LineItems18 (LineItems18)
import Types.PurchaseOrder20230207 (PurchaseOrder20230207)

data CreatePurchaseOrder20230207Response
  = CreatePurchaseOrder20230207ResponseVariant1 CreatePurchaseOrder20230207Response
  | CreatePurchaseOrder20230207ResponseVariant2 CreatePurchaseOrder20230207Response1
  deriving (Show, Eq)

instance FromJSON CreatePurchaseOrder20230207Response where
  parseJSON value = asum
    [ CreatePurchaseOrder20230207ResponseVariant1 <$> parseJSON value
    , CreatePurchaseOrder20230207ResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreatePurchaseOrder20230207Response where
  toJSON = \case
    CreatePurchaseOrder20230207ResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreatePurchaseOrder20230207ResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
