{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems18 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LineItems18 = LineItems18
  { accountId :: Maybe Text
  , amount :: Maybe Text
  , amountBilled :: Maybe Text
  , amountReceived :: Maybe Text
  , classId :: Maybe Text
  , description :: Maybe Text
  , itemId :: Maybe Text
  , itemName :: Maybe Text
  , platformId :: Text
  , quantity :: Maybe Text
  , quantityBill :: Maybe Text
  , quantityReceived :: Maybe Text
  , taxRateId :: Maybe Text
  , unitAmount :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON LineItems18 where
  parseJSON = withObject "LineItems18" $ \obj -> do
    accountId <- obj .: "account_id"
    amount <- obj .: "amount"
    amountBilled <- obj .: "amount_billed"
    amountReceived <- obj .: "amount_received"
    classId <- obj .: "class_id"
    description <- obj .: "description"
    itemId <- obj .: "item_id"
    itemName <- obj .: "item_name"
    platformId <- obj .: "platform_id"
    quantity <- obj .: "quantity"
    quantityBill <- obj .: "quantity_bill"
    quantityReceived <- obj .: "quantity_received"
    taxRateId <- obj .: "tax_rate_id"
    unitAmount <- obj .: "unit_amount"
    pure $ LineItems18{..}

instance ToJSON LineItems18 where
  toJSON LineItems18{..} =
    object [
      "account_id" .= accountId,
      "amount" .= amount,
      "amount_billed" .= amountBilled,
      "amount_received" .= amountReceived,
      "class_id" .= classId,
      "description" .= description,
      "item_id" .= itemId,
      "item_name" .= itemName,
      "platform_id" .= platformId,
      "quantity" .= quantity,
      "quantity_bill" .= quantityBill,
      "quantity_received" .= quantityReceived,
      "tax_rate_id" .= taxRateId,
      "unit_amount" .= unitAmount
    ]
