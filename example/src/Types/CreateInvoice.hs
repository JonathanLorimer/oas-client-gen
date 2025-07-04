{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateInvoice where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields28 (AdditionalFields28)
import Types.AdditionalFields29 (AdditionalFields29)
import Types.Addresses3 (Addresses3)
import Types.Item9 (Item9)
import Types.LineItems13 (LineItems13)
import Types.LinkedSalesOrder (LinkedSalesOrder)

data CreateInvoice = CreateInvoice
  { accountId :: Text
  , additionalFields :: AdditionalFields28
  , classId :: Text
  , currencyCode :: Text
  , customerId :: Text
  , documentNumber :: Text
  , dueDate :: Text
  , issueDate :: Text
  , lineItems :: [LineItems13]
  , memo :: Text
  , paymentTermsId :: Text
  , status :: Text
  , subsidiaryId :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateInvoice where
  parseJSON = withObject "CreateInvoice" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    classId <- obj .: "class_id"
    currencyCode <- obj .: "currency_code"
    customerId <- obj .: "customer_id"
    documentNumber <- obj .: "document_number"
    dueDate <- obj .: "due_date"
    issueDate <- obj .: "issue_date"
    lineItems <- obj .: "line_items"
    memo <- obj .: "memo"
    paymentTermsId <- obj .: "payment_terms_id"
    status <- obj .: "status"
    subsidiaryId <- obj .: "subsidiary_id"
    pure $ CreateInvoice{..}

instance ToJSON CreateInvoice where
  toJSON CreateInvoice{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "class_id" .= classId,
      "currency_code" .= currencyCode,
      "customer_id" .= customerId,
      "document_number" .= documentNumber,
      "due_date" .= dueDate,
      "issue_date" .= issueDate,
      "line_items" .= lineItems,
      "memo" .= memo,
      "payment_terms_id" .= paymentTermsId,
      "status" .= status,
      "subsidiary_id" .= subsidiaryId
    ]
