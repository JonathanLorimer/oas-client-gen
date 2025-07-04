{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.InvoiceCreditMemoResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data InvoiceCreditMemoResponseWithConnection = InvoiceCreditMemoResponseWithConnection
  { connection :: Connection
  , invoiceCreditMemo :: InvoiceCreditMemo
  }
  deriving (Show, Eq)

instance FromJSON InvoiceCreditMemoResponseWithConnection where
  parseJSON = withObject "InvoiceCreditMemoResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    invoiceCreditMemo <- obj .: "invoice_credit_memo"
    pure $ InvoiceCreditMemoResponseWithConnection{..}

instance ToJSON InvoiceCreditMemoResponseWithConnection where
  toJSON InvoiceCreditMemoResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "invoice_credit_memo" .= invoiceCreditMemo
    ]
