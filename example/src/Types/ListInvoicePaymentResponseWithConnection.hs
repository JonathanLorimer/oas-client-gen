{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListInvoicePaymentResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields24 (AdditionalFields24)
import Types.InvoicePayment (InvoicePayment)
import Types.LinkedInvoices2 (LinkedInvoices2)
import Types.LinkedJournalEntries2 (LinkedJournalEntries2)

data ListInvoicePaymentResponseWithConnection = ListInvoicePaymentResponseWithConnection
  { connection :: Connection
  , invoicePayments :: [InvoicePayment]
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListInvoicePaymentResponseWithConnection where
  parseJSON = withObject "ListInvoicePaymentResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    invoicePayments <- obj .: "invoice_payments"
    nextCursor <- obj .: "next_cursor"
    pure $ ListInvoicePaymentResponseWithConnection{..}

instance ToJSON ListInvoicePaymentResponseWithConnection where
  toJSON ListInvoicePaymentResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "invoice_payments" .= invoicePayments,
      "next_cursor" .= nextCursor
    ]
