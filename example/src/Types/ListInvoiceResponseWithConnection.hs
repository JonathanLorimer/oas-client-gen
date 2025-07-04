{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListInvoiceResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields26 (AdditionalFields26)
import Types.AdditionalFields27 (AdditionalFields27)
import Types.Addresses2 (Addresses2)
import Types.Invoice (Invoice)
import Types.Item8 (Item8)
import Types.LineItems12 (LineItems12)
import Types.LinkedJournalEntries3 (LinkedJournalEntries3)
import Types.LinkedPayments3 (LinkedPayments3)

data ListInvoiceResponseWithConnection = ListInvoiceResponseWithConnection
  { connection :: Connection
  , invoices :: [Invoice]
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListInvoiceResponseWithConnection where
  parseJSON = withObject "ListInvoiceResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    invoices <- obj .: "invoices"
    nextCursor <- obj .: "next_cursor"
    pure $ ListInvoiceResponseWithConnection{..}

instance ToJSON ListInvoiceResponseWithConnection where
  toJSON ListInvoiceResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "invoices" .= invoices,
      "next_cursor" .= nextCursor
    ]
