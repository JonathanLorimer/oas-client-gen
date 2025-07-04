{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBill where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields11 (AdditionalFields11)
import Types.AdditionalFields12 (AdditionalFields12)
import Types.Item3 (Item3)
import Types.LineItems5 (LineItems5)
import Types.LinkedPurchaseOrders1 (LinkedPurchaseOrders1)

data CreateBill = CreateBill
  { accountId :: Text
  , additionalFields :: AdditionalFields11
  , currencyCode :: Text
  , currencyRate :: Text
  , documentNumber :: Text
  , dueDate :: Text
  , issueDate :: Text
  , lineItems :: [LineItems5]
  , linkedPurchaseOrders :: [LinkedPurchaseOrders1]
  , memo :: Text
  , paymentTermsId :: Text
  , subsidiaryId :: Text
  , vendorId :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateBill where
  parseJSON = withObject "CreateBill" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    currencyCode <- obj .: "currency_code"
    currencyRate <- obj .: "currency_rate"
    documentNumber <- obj .: "document_number"
    dueDate <- obj .: "due_date"
    issueDate <- obj .: "issue_date"
    lineItems <- obj .: "line_items"
    linkedPurchaseOrders <- obj .: "linked_purchase_orders"
    memo <- obj .: "memo"
    paymentTermsId <- obj .: "payment_terms_id"
    subsidiaryId <- obj .: "subsidiary_id"
    vendorId <- obj .: "vendor_id"
    pure $ CreateBill{..}

instance ToJSON CreateBill where
  toJSON CreateBill{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "currency_code" .= currencyCode,
      "currency_rate" .= currencyRate,
      "document_number" .= documentNumber,
      "due_date" .= dueDate,
      "issue_date" .= issueDate,
      "line_items" .= lineItems,
      "linked_purchase_orders" .= linkedPurchaseOrders,
      "memo" .= memo,
      "payment_terms_id" .= paymentTermsId,
      "subsidiary_id" .= subsidiaryId,
      "vendor_id" .= vendorId
    ]
