{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.InvoiceTransactionPdfLinkResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Invoice1 (Invoice1)

data InvoiceTransactionPdfLinkResponse = InvoiceTransactionPdfLinkResponse
  { invoice :: Invoice1
  }
  deriving (Show, Eq)

instance FromJSON InvoiceTransactionPdfLinkResponse where
  parseJSON = withObject "InvoiceTransactionPdfLinkResponse" $ \obj -> do
    invoice <- obj .: "invoice"
    pure $ InvoiceTransactionPdfLinkResponse{..}

instance ToJSON InvoiceTransactionPdfLinkResponse where
  toJSON InvoiceTransactionPdfLinkResponse{..} =
    object [
      "invoice" .= invoice
    ]
