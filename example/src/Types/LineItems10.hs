{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems10 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields21 (AdditionalFields21)

data LineItems10 = LineItems10
  { accountId :: Maybe Text
  , additionalFields :: AdditionalFields21
  , amount :: Maybe Text
  , classId :: Maybe Text
  , description :: Maybe Text
  , discountAmount :: Maybe Text
  , discountPercentage :: Maybe Text
  , id :: Maybe Text
  , itemId :: Maybe Text
  , platformId :: Text
  , quantity :: Maybe Double
  , subTotal :: Maybe Text
  , taxAmount :: Maybe Text
  , taxRateId :: Maybe Text
  , unitAmount :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON LineItems10 where
  parseJSON = withObject "LineItems10" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    amount <- obj .: "amount"
    classId <- obj .: "class_id"
    description <- obj .: "description"
    discountAmount <- obj .: "discount_amount"
    discountPercentage <- obj .: "discount_percentage"
    id <- obj .: "id"
    itemId <- obj .: "item_id"
    platformId <- obj .: "platform_id"
    quantity <- obj .: "quantity"
    subTotal <- obj .: "sub_total"
    taxAmount <- obj .: "tax_amount"
    taxRateId <- obj .: "tax_rate_id"
    unitAmount <- obj .: "unit_amount"
    pure $ LineItems10{..}

instance ToJSON LineItems10 where
  toJSON LineItems10{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "amount" .= amount,
      "class_id" .= classId,
      "description" .= description,
      "discount_amount" .= discountAmount,
      "discount_percentage" .= discountPercentage,
      "id" .= id,
      "item_id" .= itemId,
      "platform_id" .= platformId,
      "quantity" .= quantity,
      "sub_total" .= subTotal,
      "tax_amount" .= taxAmount,
      "tax_rate_id" .= taxRateId,
      "unit_amount" .= unitAmount
    ]
