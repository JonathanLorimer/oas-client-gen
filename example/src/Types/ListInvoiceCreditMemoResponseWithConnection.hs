{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListInvoiceCreditMemoResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields21 (AdditionalFields21)
import Types.InvoiceCreditMemo (InvoiceCreditMemo)
import Types.LineItems10 (LineItems10)
import Types.LinkedInvoices1 (LinkedInvoices1)

data ListInvoiceCreditMemoResponseWithConnection = ListInvoiceCreditMemoResponseWithConnection
  { connection :: Connection
  , invoiceCreditMemos :: [InvoiceCreditMemo]
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListInvoiceCreditMemoResponseWithConnection where
  parseJSON = withObject "ListInvoiceCreditMemoResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    invoiceCreditMemos <- obj .: "invoice_credit_memos"
    nextCursor <- obj .: "next_cursor"
    pure $ ListInvoiceCreditMemoResponseWithConnection{..}

instance ToJSON ListInvoiceCreditMemoResponseWithConnection where
  toJSON ListInvoiceCreditMemoResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "invoice_credit_memos" .= invoiceCreditMemos,
      "next_cursor" .= nextCursor
    ]
