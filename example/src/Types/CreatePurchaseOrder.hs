{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreatePurchaseOrder where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields35 (AdditionalFields35)
import Types.LineItems17 (LineItems17)

data CreatePurchaseOrder = CreatePurchaseOrder
  { additionalFields :: AdditionalFields35
  , currency :: Text
  , currencyRate :: Double
  , documentNumber :: Text
  , lineItems :: [LineItems17]
  , memo :: Text
  , status :: Text
  , subsidiaryId :: Text
  , txnDate :: Text
  , vendorId :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreatePurchaseOrder where
  parseJSON = withObject "CreatePurchaseOrder" $ \obj -> do
    additionalFields <- obj .: "additional_fields"
    currency <- obj .: "currency"
    currencyRate <- obj .: "currency_rate"
    documentNumber <- obj .: "document_number"
    lineItems <- obj .: "line_items"
    memo <- obj .: "memo"
    status <- obj .: "status"
    subsidiaryId <- obj .: "subsidiary_id"
    txnDate <- obj .: "txn_date"
    vendorId <- obj .: "vendor_id"
    pure $ CreatePurchaseOrder{..}

instance ToJSON CreatePurchaseOrder where
  toJSON CreatePurchaseOrder{..} =
    object [
      "additional_fields" .= additionalFields,
      "currency" .= currency,
      "currency_rate" .= currencyRate,
      "document_number" .= documentNumber,
      "line_items" .= lineItems,
      "memo" .= memo,
      "status" .= status,
      "subsidiary_id" .= subsidiaryId,
      "txn_date" .= txnDate,
      "vendor_id" .= vendorId
    ]
