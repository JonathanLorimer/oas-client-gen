{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateInvoiceCreditMemo where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields22 (AdditionalFields22)
import Types.AdditionalFields23 (AdditionalFields23)
import Types.Item7 (Item7)
import Types.LineItems11 (LineItems11)

data CreateInvoiceCreditMemo = CreateInvoiceCreditMemo
  { accountId :: Text
  , additionalFields :: AdditionalFields22
  , currencyCode :: Text
  , customerId :: Text
  , documentNumber :: Text
  , issueDate :: Text
  , lineItems :: [LineItems11]
  , memo :: Text
  , status :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateInvoiceCreditMemo where
  parseJSON = withObject "CreateInvoiceCreditMemo" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    currencyCode <- obj .: "currency_code"
    customerId <- obj .: "customer_id"
    documentNumber <- obj .: "document_number"
    issueDate <- obj .: "issue_date"
    lineItems <- obj .: "line_items"
    memo <- obj .: "memo"
    status <- obj .: "status"
    pure $ CreateInvoiceCreditMemo{..}

instance ToJSON CreateInvoiceCreditMemo where
  toJSON CreateInvoiceCreditMemo{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "currency_code" .= currencyCode,
      "customer_id" .= customerId,
      "document_number" .= documentNumber,
      "issue_date" .= issueDate,
      "line_items" .= lineItems,
      "memo" .= memo,
      "status" .= status
    ]
