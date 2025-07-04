{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.InvoicePaymentResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data InvoicePaymentResponseWithConnection = InvoicePaymentResponseWithConnection
  { connection :: Connection
  , invoicePayment :: InvoicePayment
  }
  deriving (Show, Eq)

instance FromJSON InvoicePaymentResponseWithConnection where
  parseJSON = withObject "InvoicePaymentResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    invoicePayment <- obj .: "invoice_payment"
    pure $ InvoicePaymentResponseWithConnection{..}

instance ToJSON InvoicePaymentResponseWithConnection where
  toJSON InvoicePaymentResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "invoice_payment" .= invoicePayment
    ]
