{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListBillPaymentResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields7 (AdditionalFields7)
import Types.BillPayment (BillPayment)
import Types.LinkedBills2 (LinkedBills2)
import Types.LinkedJournalEntries (LinkedJournalEntries)

data ListBillPaymentResponseWithConnection = ListBillPaymentResponseWithConnection
  { billPayments :: [BillPayment]
  , connection :: Connection
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListBillPaymentResponseWithConnection where
  parseJSON = withObject "ListBillPaymentResponseWithConnection" $ \obj -> do
    billPayments <- obj .: "bill_payments"
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    pure $ ListBillPaymentResponseWithConnection{..}

instance ToJSON ListBillPaymentResponseWithConnection where
  toJSON ListBillPaymentResponseWithConnection{..} =
    object [
      "bill_payments" .= billPayments,
      "connection" .= connection,
      "next_cursor" .= nextCursor
    ]
