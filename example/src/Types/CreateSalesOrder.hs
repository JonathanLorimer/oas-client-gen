{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateSalesOrder where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields37 (AdditionalFields37)
import Types.Item12 (Item12)
import Types.LineItems20 (LineItems20)

data CreateSalesOrder = CreateSalesOrder
  { classId :: Text
  , currencyCode :: Text
  , customerId :: Text
  , departmentId :: Text
  , issueDate :: Text
  , lineItems :: [LineItems20]
  , locationId :: Text
  , memo :: Text
  , paymentTermsId :: Text
  , subsidiaryId :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateSalesOrder where
  parseJSON = withObject "CreateSalesOrder" $ \obj -> do
    classId <- obj .: "class_id"
    currencyCode <- obj .: "currency_code"
    customerId <- obj .: "customer_id"
    departmentId <- obj .: "department_id"
    issueDate <- obj .: "issue_date"
    lineItems <- obj .: "line_items"
    locationId <- obj .: "location_id"
    memo <- obj .: "memo"
    paymentTermsId <- obj .: "payment_terms_id"
    subsidiaryId <- obj .: "subsidiary_id"
    pure $ CreateSalesOrder{..}

instance ToJSON CreateSalesOrder where
  toJSON CreateSalesOrder{..} =
    object [
      "class_id" .= classId,
      "currency_code" .= currencyCode,
      "customer_id" .= customerId,
      "department_id" .= departmentId,
      "issue_date" .= issueDate,
      "line_items" .= lineItems,
      "location_id" .= locationId,
      "memo" .= memo,
      "payment_terms_id" .= paymentTermsId,
      "subsidiary_id" .= subsidiaryId
    ]
