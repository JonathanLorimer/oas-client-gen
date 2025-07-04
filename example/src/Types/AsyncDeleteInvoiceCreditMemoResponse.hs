{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteInvoiceCreditMemoResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncDeleteInvoiceCreditMemoResponse1 (AsyncDeleteInvoiceCreditMemoResponse1)
import Types.AsyncResponse25 (AsyncResponse25)

data AsyncDeleteInvoiceCreditMemoResponse
  = AsyncDeleteInvoiceCreditMemoResponseVariant1 AsyncDeleteInvoiceCreditMemoResponse
  | AsyncDeleteInvoiceCreditMemoResponseVariant2 AsyncDeleteInvoiceCreditMemoResponse1
  deriving (Show, Eq)

instance FromJSON AsyncDeleteInvoiceCreditMemoResponse where
  parseJSON value = asum
    [ AsyncDeleteInvoiceCreditMemoResponseVariant1 <$> parseJSON value
    , AsyncDeleteInvoiceCreditMemoResponseVariant2 <$> parseJSON value
    ]

instance ToJSON AsyncDeleteInvoiceCreditMemoResponse where
  toJSON = \case
    AsyncDeleteInvoiceCreditMemoResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    AsyncDeleteInvoiceCreditMemoResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
