{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateInvoicePaymentRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields25 (AdditionalFields25)
import Types.CreateInvoicePayment (CreateInvoicePayment)
import Types.LinkedInvoices3 (LinkedInvoices3)

data CreateCreateInvoicePaymentRequest = CreateCreateInvoicePaymentRequest
  { invoicePayment :: CreateInvoicePayment
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateInvoicePaymentRequest where
  parseJSON = withObject "CreateCreateInvoicePaymentRequest" $ \obj -> do
    invoicePayment <- obj .: "invoice_payment"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateInvoicePaymentRequest{..}

instance ToJSON CreateCreateInvoicePaymentRequest where
  toJSON CreateCreateInvoicePaymentRequest{..} =
    object [
      "invoice_payment" .= invoicePayment,
      "response_mode" .= responseMode
    ]
