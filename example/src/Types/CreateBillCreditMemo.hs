{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBillCreditMemo where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields6 (AdditionalFields6)
import Types.Item1 (Item1)
import Types.LineItems3 (LineItems3)

data CreateBillCreditMemo = CreateBillCreditMemo
  { accountId :: Text
  , additionalFields :: AdditionalFields6
  , currencyCode :: Text
  , documentNumber :: Text
  , issueDate :: Text
  , lineItems :: [LineItems3]
  , memo :: Text
  , status :: Text
  , subsidiaryId :: Text
  , vendorId :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateBillCreditMemo where
  parseJSON = withObject "CreateBillCreditMemo" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    currencyCode <- obj .: "currency_code"
    documentNumber <- obj .: "document_number"
    issueDate <- obj .: "issue_date"
    lineItems <- obj .: "line_items"
    memo <- obj .: "memo"
    status <- obj .: "status"
    subsidiaryId <- obj .: "subsidiary_id"
    vendorId <- obj .: "vendor_id"
    pure $ CreateBillCreditMemo{..}

instance ToJSON CreateBillCreditMemo where
  toJSON CreateBillCreditMemo{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "currency_code" .= currencyCode,
      "document_number" .= documentNumber,
      "issue_date" .= issueDate,
      "line_items" .= lineItems,
      "memo" .= memo,
      "status" .= status,
      "subsidiary_id" .= subsidiaryId,
      "vendor_id" .= vendorId
    ]
