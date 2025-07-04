{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateExpense where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields19 (AdditionalFields19)
import Types.AdditionalFields20 (AdditionalFields20)
import Types.Item6 (Item6)
import Types.LineItems9 (LineItems9)

data CreateExpense = CreateExpense
  { accountId :: Text
  , additionalFields :: AdditionalFields19
  , currencyCode :: Text
  , currencyRate :: Double
  , customerId :: Maybe Text
  , expenseType :: Text
  , lineItems :: [LineItems9]
  , memo :: Text
  , subsidiaryId :: Text
  , transactionDate :: Text
  , vendorId :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateExpense where
  parseJSON = withObject "CreateExpense" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    currencyCode <- obj .: "currency_code"
    currencyRate <- obj .: "currency_rate"
    customerId <- obj .: "customer_id"
    expenseType <- obj .: "expense_type"
    lineItems <- obj .: "line_items"
    memo <- obj .: "memo"
    subsidiaryId <- obj .: "subsidiary_id"
    transactionDate <- obj .: "transaction_date"
    vendorId <- obj .: "vendor_id"
    pure $ CreateExpense{..}

instance ToJSON CreateExpense where
  toJSON CreateExpense{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "currency_code" .= currencyCode,
      "currency_rate" .= currencyRate,
      "customer_id" .= customerId,
      "expense_type" .= expenseType,
      "line_items" .= lineItems,
      "memo" .= memo,
      "subsidiary_id" .= subsidiaryId,
      "transaction_date" .= transactionDate,
      "vendor_id" .= vendorId
    ]
