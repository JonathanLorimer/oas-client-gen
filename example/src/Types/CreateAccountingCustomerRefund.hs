{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateAccountingCustomerRefund where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields15 (AdditionalFields15)
import Types.AdditionalFields16 (AdditionalFields16)
import Types.Item5 (Item5)
import Types.LineItems7 (LineItems7)

data CreateAccountingCustomerRefund = CreateAccountingCustomerRefund
  { accountId :: Text
  , additionalFields :: AdditionalFields15
  , classId :: Text
  , currencyCode :: Text
  , currencyRate :: Text
  , customerId :: Text
  , departmentId :: Text
  , documentNumber :: Text
  , lineItems :: [LineItems7]
  , taxRateId :: Text
  , transactionDate :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateAccountingCustomerRefund where
  parseJSON = withObject "CreateAccountingCustomerRefund" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    classId <- obj .: "class_id"
    currencyCode <- obj .: "currency_code"
    currencyRate <- obj .: "currency_rate"
    customerId <- obj .: "customer_id"
    departmentId <- obj .: "department_id"
    documentNumber <- obj .: "document_number"
    lineItems <- obj .: "line_items"
    taxRateId <- obj .: "tax_rate_id"
    transactionDate <- obj .: "transaction_date"
    pure $ CreateAccountingCustomerRefund{..}

instance ToJSON CreateAccountingCustomerRefund where
  toJSON CreateAccountingCustomerRefund{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "class_id" .= classId,
      "currency_code" .= currencyCode,
      "currency_rate" .= currencyRate,
      "customer_id" .= customerId,
      "department_id" .= departmentId,
      "document_number" .= documentNumber,
      "line_items" .= lineItems,
      "tax_rate_id" .= taxRateId,
      "transaction_date" .= transactionDate
    ]
