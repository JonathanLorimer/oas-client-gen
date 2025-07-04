{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateItem where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields30 (AdditionalFields30)
import Types.BillItem1 (BillItem1)
import Types.InvoiceItem1 (InvoiceItem1)

data CreateItem = CreateItem
  { additionalFields :: AdditionalFields30
  , assetAccountId :: Text
  , billItem :: BillItem1
  , code :: Text
  , invoiceItem :: InvoiceItem1
  , name :: Text
  , quantityOnHand :: Double
  , type_ :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateItem where
  parseJSON = withObject "CreateItem" $ \obj -> do
    additionalFields <- obj .: "additional_fields"
    assetAccountId <- obj .: "asset_account_id"
    billItem <- obj .: "bill_item"
    code <- obj .: "code"
    invoiceItem <- obj .: "invoice_item"
    name <- obj .: "name"
    quantityOnHand <- obj .: "quantity_on_hand"
    type_ <- obj .: "type"
    pure $ CreateItem{..}

instance ToJSON CreateItem where
  toJSON CreateItem{..} =
    object [
      "additional_fields" .= additionalFields,
      "asset_account_id" .= assetAccountId,
      "bill_item" .= billItem,
      "code" .= code,
      "invoice_item" .= invoiceItem,
      "name" .= name,
      "quantity_on_hand" .= quantityOnHand,
      "type" .= type_
    ]
