{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteInvoicePaymentResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncDeleteInvoicePaymentResponse1 (AsyncDeleteInvoicePaymentResponse1)
import Types.AsyncResponse27 (AsyncResponse27)

data AsyncDeleteInvoicePaymentResponse
  = AsyncDeleteInvoicePaymentResponseVariant1 AsyncDeleteInvoicePaymentResponse
  | AsyncDeleteInvoicePaymentResponseVariant2 AsyncDeleteInvoicePaymentResponse1
  deriving (Show, Eq)

instance FromJSON AsyncDeleteInvoicePaymentResponse where
  parseJSON value = asum
    [ AsyncDeleteInvoicePaymentResponseVariant1 <$> parseJSON value
    , AsyncDeleteInvoicePaymentResponseVariant2 <$> parseJSON value
    ]

instance ToJSON AsyncDeleteInvoicePaymentResponse where
  toJSON = \case
    AsyncDeleteInvoicePaymentResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    AsyncDeleteInvoicePaymentResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
