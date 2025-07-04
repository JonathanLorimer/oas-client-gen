{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateInvoiceCreditMemoRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields22 (AdditionalFields22)
import Types.AdditionalFields23 (AdditionalFields23)
import Types.CreateInvoiceCreditMemo (CreateInvoiceCreditMemo)
import Types.Item7 (Item7)
import Types.LineItems11 (LineItems11)

data CreateCreateInvoiceCreditMemoRequest = CreateCreateInvoiceCreditMemoRequest
  { invoiceCreditMemo :: CreateInvoiceCreditMemo
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateInvoiceCreditMemoRequest where
  parseJSON = withObject "CreateCreateInvoiceCreditMemoRequest" $ \obj -> do
    invoiceCreditMemo <- obj .: "invoice_credit_memo"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateInvoiceCreditMemoRequest{..}

instance ToJSON CreateCreateInvoiceCreditMemoRequest where
  toJSON CreateCreateInvoiceCreditMemoRequest{..} =
    object [
      "invoice_credit_memo" .= invoiceCreditMemo,
      "response_mode" .= responseMode
    ]
