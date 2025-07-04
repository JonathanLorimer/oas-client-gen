{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Invoice where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields26 (AdditionalFields26)
import Types.AdditionalFields27 (AdditionalFields27)
import Types.Addresses2 (Addresses2)
import Types.Item8 (Item8)
import Types.LineItems12 (LineItems12)
import Types.LinkedJournalEntries3 (LinkedJournalEntries3)
import Types.LinkedPayments3 (LinkedPayments3)

data Invoice = Invoice
  { accountId :: Maybe Text
  , additionalFields :: AdditionalFields26
  , addresses :: [Addresses2]
  , amountDue :: Maybe Double
  , classId :: Maybe Text
  , createdAt :: Maybe Text
  , currencyCode :: Maybe Text
  , customerId :: Maybe Text
  , discountAmount :: Maybe Double
  , documentNumber :: Maybe Text
  , dueDate :: Maybe Text
  , id :: Text
  , issueDate :: Maybe Text
  , lastSyncedAt :: Text
  , lineItems :: [LineItems12]
  , linkedPayments :: [LinkedPayments3]
  , memo :: Maybe Text
  , paymentTermsId :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , status :: Text
  , subTotal :: Maybe Double
  , subsidiaryId :: Maybe Text
  , taxAmount :: Maybe Double
  , totalAmount :: Maybe Double
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Invoice where
  parseJSON = withObject "Invoice" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    addresses <- obj .: "addresses"
    amountDue <- obj .: "amount_due"
    classId <- obj .: "class_id"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    customerId <- obj .: "customer_id"
    discountAmount <- obj .: "discount_amount"
    documentNumber <- obj .: "document_number"
    dueDate <- obj .: "due_date"
    id <- obj .: "id"
    issueDate <- obj .: "issue_date"
    lastSyncedAt <- obj .: "last_synced_at"
    lineItems <- obj .: "line_items"
    linkedPayments <- obj .: "linked_payments"
    memo <- obj .: "memo"
    paymentTermsId <- obj .: "payment_terms_id"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    status <- obj .: "status"
    subTotal <- obj .: "sub_total"
    subsidiaryId <- obj .: "subsidiary_id"
    taxAmount <- obj .: "tax_amount"
    totalAmount <- obj .: "total_amount"
    updatedAt <- obj .: "updated_at"
    pure $ Invoice{..}

instance ToJSON Invoice where
  toJSON Invoice{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "addresses" .= addresses,
      "amount_due" .= amountDue,
      "class_id" .= classId,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "customer_id" .= customerId,
      "discount_amount" .= discountAmount,
      "document_number" .= documentNumber,
      "due_date" .= dueDate,
      "id" .= id,
      "issue_date" .= issueDate,
      "last_synced_at" .= lastSyncedAt,
      "line_items" .= lineItems,
      "linked_payments" .= linkedPayments,
      "memo" .= memo,
      "payment_terms_id" .= paymentTermsId,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "status" .= status,
      "sub_total" .= subTotal,
      "subsidiary_id" .= subsidiaryId,
      "tax_amount" .= taxAmount,
      "total_amount" .= totalAmount,
      "updated_at" .= updatedAt
    ]
