{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateInvoiceCreditMemoResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse24 (AsyncResponse24)
import Types.CreateInvoiceCreditMemoResponse1 (CreateInvoiceCreditMemoResponse1)

data CreateInvoiceCreditMemoResponse
  = CreateInvoiceCreditMemoResponseVariant1 CreateInvoiceCreditMemoResponse
  | CreateInvoiceCreditMemoResponseVariant2 CreateInvoiceCreditMemoResponse1
  deriving (Show, Eq)

instance FromJSON CreateInvoiceCreditMemoResponse where
  parseJSON value = asum
    [ CreateInvoiceCreditMemoResponseVariant1 <$> parseJSON value
    , CreateInvoiceCreditMemoResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateInvoiceCreditMemoResponse where
  toJSON = \case
    CreateInvoiceCreditMemoResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateInvoiceCreditMemoResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
