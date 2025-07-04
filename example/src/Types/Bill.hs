{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Bill where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields10 (AdditionalFields10)
import Types.AdditionalFields9 (AdditionalFields9)
import Types.Item2 (Item2)
import Types.LineItems4 (LineItems4)
import Types.LinkedCreditMemos (LinkedCreditMemos)
import Types.LinkedJournalEntries1 (LinkedJournalEntries1)
import Types.LinkedPayments2 (LinkedPayments2)
import Types.LinkedPurchaseOrders (LinkedPurchaseOrders)

data Bill = Bill
  { accountId :: Maybe Text
  , additionalFields :: AdditionalFields9
  , amountDue :: Double
  , createdAt :: Maybe Text
  , currencyCode :: Text
  , currencyRate :: Maybe Text
  , documentNumber :: Maybe Text
  , dueDate :: Maybe Text
  , id :: Text
  , issueDate :: Text
  , lastSyncedAt :: Text
  , lineItems :: [LineItems4]
  , linkedCreditMemos :: [LinkedCreditMemos]
  , linkedPayments :: [LinkedPayments2]
  , linkedPurchaseOrders :: [LinkedPurchaseOrders]
  , memo :: Maybe Text
  , paymentTermsId :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , status :: Text
  , subTotal :: Maybe Double
  , subsidiaryId :: Maybe Text
  , taxAmount :: Maybe Double
  , totalAmount :: Double
  , totalDiscount :: Maybe Double
  , updatedAt :: Maybe Text
  , vendorId :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Bill where
  parseJSON = withObject "Bill" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    amountDue <- obj .: "amount_due"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    currencyRate <- obj .: "currency_rate"
    documentNumber <- obj .: "document_number"
    dueDate <- obj .: "due_date"
    id <- obj .: "id"
    issueDate <- obj .: "issue_date"
    lastSyncedAt <- obj .: "last_synced_at"
    lineItems <- obj .: "line_items"
    linkedCreditMemos <- obj .: "linked_credit_memos"
    linkedPayments <- obj .: "linked_payments"
    linkedPurchaseOrders <- obj .: "linked_purchase_orders"
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
    totalDiscount <- obj .: "total_discount"
    updatedAt <- obj .: "updated_at"
    vendorId <- obj .: "vendor_id"
    pure $ Bill{..}

instance ToJSON Bill where
  toJSON Bill{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "amount_due" .= amountDue,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "currency_rate" .= currencyRate,
      "document_number" .= documentNumber,
      "due_date" .= dueDate,
      "id" .= id,
      "issue_date" .= issueDate,
      "last_synced_at" .= lastSyncedAt,
      "line_items" .= lineItems,
      "linked_credit_memos" .= linkedCreditMemos,
      "linked_payments" .= linkedPayments,
      "linked_purchase_orders" .= linkedPurchaseOrders,
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
      "total_discount" .= totalDiscount,
      "updated_at" .= updatedAt,
      "vendor_id" .= vendorId
    ]
