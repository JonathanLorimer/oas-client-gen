{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBankTransfer where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields3 (AdditionalFields3)

data CreateBankTransfer = CreateBankTransfer
  { additionalFields :: AdditionalFields3
  , classId :: Text
  , creditAccountId :: Text
  , debitAccountId :: Text
  , departmentId :: Text
  , locationId :: Text
  , memo :: Text
  , totalAmount :: Double
  , transactionDate :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateBankTransfer where
  parseJSON = withObject "CreateBankTransfer" $ \obj -> do
    additionalFields <- obj .: "additional_fields"
    classId <- obj .: "class_id"
    creditAccountId <- obj .: "credit_account_id"
    debitAccountId <- obj .: "debit_account_id"
    departmentId <- obj .: "department_id"
    locationId <- obj .: "location_id"
    memo <- obj .: "memo"
    totalAmount <- obj .: "total_amount"
    transactionDate <- obj .: "transaction_date"
    pure $ CreateBankTransfer{..}

instance ToJSON CreateBankTransfer where
  toJSON CreateBankTransfer{..} =
    object [
      "additional_fields" .= additionalFields,
      "class_id" .= classId,
      "credit_account_id" .= creditAccountId,
      "debit_account_id" .= debitAccountId,
      "department_id" .= departmentId,
      "location_id" .= locationId,
      "memo" .= memo,
      "total_amount" .= totalAmount,
      "transaction_date" .= transactionDate
    ]
