{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateInvoiceCreditApplication where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.LinkedInvoices (LinkedInvoices)

data CreateInvoiceCreditApplication = CreateInvoiceCreditApplication
  { accountId :: Text
  , currencyCode :: Text
  , customerId :: Text
  , invoiceCreditMemoId :: Text
  , linkedInvoices :: [LinkedInvoices]
  , memo :: Text
  , transactionDate :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateInvoiceCreditApplication where
  parseJSON = withObject "CreateInvoiceCreditApplication" $ \obj -> do
    accountId <- obj .: "account_id"
    currencyCode <- obj .: "currency_code"
    customerId <- obj .: "customer_id"
    invoiceCreditMemoId <- obj .: "invoice_credit_memo_id"
    linkedInvoices <- obj .: "linked_invoices"
    memo <- obj .: "memo"
    transactionDate <- obj .: "transaction_date"
    pure $ CreateInvoiceCreditApplication{..}

instance ToJSON CreateInvoiceCreditApplication where
  toJSON CreateInvoiceCreditApplication{..} =
    object [
      "account_id" .= accountId,
      "currency_code" .= currencyCode,
      "customer_id" .= customerId,
      "invoice_credit_memo_id" .= invoiceCreditMemoId,
      "linked_invoices" .= linkedInvoices,
      "memo" .= memo,
      "transaction_date" .= transactionDate
    ]
