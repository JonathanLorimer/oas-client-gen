{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AccountingItem where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.BillItem (BillItem)
import Types.InvoiceItem (InvoiceItem)
import Types.Subsidiaries1 (Subsidiaries1)

data AccountingItem = AccountingItem
  { billItem :: BillItem
  , code :: Maybe Text
  , createdAt :: Maybe Text
  , id :: Text
  , invoiceItem :: InvoiceItem
  , lastSyncedAt :: Text
  , name :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , quantityOnHand :: Maybe Double
  , status :: Text
  , subsidiaries :: [Subsidiaries1]
  , type_ :: Text
  , updatedAt :: Text
  }
  deriving (Show, Eq)

instance FromJSON AccountingItem where
  parseJSON = withObject "AccountingItem" $ \obj -> do
    billItem <- obj .: "bill_item"
    code <- obj .: "code"
    createdAt <- obj .: "created_at"
    id <- obj .: "id"
    invoiceItem <- obj .: "invoice_item"
    lastSyncedAt <- obj .: "last_synced_at"
    name <- obj .: "name"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    quantityOnHand <- obj .: "quantity_on_hand"
    status <- obj .: "status"
    subsidiaries <- obj .: "subsidiaries"
    type_ <- obj .: "type"
    updatedAt <- obj .: "updated_at"
    pure $ AccountingItem{..}

instance ToJSON AccountingItem where
  toJSON AccountingItem{..} =
    object [
      "bill_item" .= billItem,
      "code" .= code,
      "created_at" .= createdAt,
      "id" .= id,
      "invoice_item" .= invoiceItem,
      "last_synced_at" .= lastSyncedAt,
      "name" .= name,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "quantity_on_hand" .= quantityOnHand,
      "status" .= status,
      "subsidiaries" .= subsidiaries,
      "type" .= type_,
      "updated_at" .= updatedAt
    ]
