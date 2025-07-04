{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBillCreditApplication where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields4 (AdditionalFields4)
import Types.LinkedBills (LinkedBills)

data CreateBillCreditApplication = CreateBillCreditApplication
  { additionalFields :: AdditionalFields4
  , billCreditMemoId :: Text
  , currencyCode :: Text
  , linkedBills :: [LinkedBills]
  , memo :: Text
  , transactionDate :: Text
  , vendorId :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateBillCreditApplication where
  parseJSON = withObject "CreateBillCreditApplication" $ \obj -> do
    additionalFields <- obj .: "additional_fields"
    billCreditMemoId <- obj .: "bill_credit_memo_id"
    currencyCode <- obj .: "currency_code"
    linkedBills <- obj .: "linked_bills"
    memo <- obj .: "memo"
    transactionDate <- obj .: "transaction_date"
    vendorId <- obj .: "vendor_id"
    pure $ CreateBillCreditApplication{..}

instance ToJSON CreateBillCreditApplication where
  toJSON CreateBillCreditApplication{..} =
    object [
      "additional_fields" .= additionalFields,
      "bill_credit_memo_id" .= billCreditMemoId,
      "currency_code" .= currencyCode,
      "linked_bills" .= linkedBills,
      "memo" .= memo,
      "transaction_date" .= transactionDate,
      "vendor_id" .= vendorId
    ]
