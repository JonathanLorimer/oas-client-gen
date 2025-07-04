{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateInvoicePayment where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields25 (AdditionalFields25)
import Types.LinkedInvoices3 (LinkedInvoices3)

data CreateInvoicePayment = CreateInvoicePayment
  { accountId :: Text
  , additionalFields :: AdditionalFields25
  , currencyCode :: Text
  , currencyRate :: Double
  , customerId :: Text
  , linkedInvoices :: [LinkedInvoices3]
  , memo :: Text
  , paymentMethodId :: Text
  , reference :: Text
  , totalAmount :: Double
  , txnDate :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateInvoicePayment where
  parseJSON = withObject "CreateInvoicePayment" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    currencyCode <- obj .: "currency_code"
    currencyRate <- obj .: "currency_rate"
    customerId <- obj .: "customer_id"
    linkedInvoices <- obj .: "linked_invoices"
    memo <- obj .: "memo"
    paymentMethodId <- obj .: "payment_method_id"
    reference <- obj .: "reference"
    totalAmount <- obj .: "total_amount"
    txnDate <- obj .: "txn_date"
    pure $ CreateInvoicePayment{..}

instance ToJSON CreateInvoicePayment where
  toJSON CreateInvoicePayment{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "currency_code" .= currencyCode,
      "currency_rate" .= currencyRate,
      "customer_id" .= customerId,
      "linked_invoices" .= linkedInvoices,
      "memo" .= memo,
      "payment_method_id" .= paymentMethodId,
      "reference" .= reference,
      "total_amount" .= totalAmount,
      "txn_date" .= txnDate
    ]
