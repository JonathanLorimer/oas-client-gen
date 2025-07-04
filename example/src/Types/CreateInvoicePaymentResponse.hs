{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateInvoicePaymentResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse26 (AsyncResponse26)
import Types.CreateInvoicePaymentResponse1 (CreateInvoicePaymentResponse1)

data CreateInvoicePaymentResponse
  = CreateInvoicePaymentResponseVariant1 CreateInvoicePaymentResponse
  | CreateInvoicePaymentResponseVariant2 CreateInvoicePaymentResponse1
  deriving (Show, Eq)

instance FromJSON CreateInvoicePaymentResponse where
  parseJSON value = asum
    [ CreateInvoicePaymentResponseVariant1 <$> parseJSON value
    , CreateInvoicePaymentResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateInvoicePaymentResponse where
  toJSON = \case
    CreateInvoicePaymentResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateInvoicePaymentResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
