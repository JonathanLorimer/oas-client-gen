{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems12 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields27 (AdditionalFields27)
import Types.Item8 (Item8)

data LineItems12 = LineItems12
  { accountId :: Maybe Text
  , additionalFields :: AdditionalFields27
  , classId :: Maybe Text
  , description :: Maybe Text
  , discountAmount :: Maybe Double
  , discountPercentage :: Maybe Double
  , item :: Maybe Item8
  , locationId :: Maybe Text
  , platformId :: Text
  , subTotal :: Maybe Double
  , taxAmount :: Maybe Double
  , taxRateId :: Maybe Text
  , totalAmount :: Maybe Double
  , type_ :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON LineItems12 where
  parseJSON = withObject "LineItems12" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    classId <- obj .: "class_id"
    description <- obj .: "description"
    discountAmount <- obj .: "discount_amount"
    discountPercentage <- obj .: "discount_percentage"
    item <- obj .: "item"
    locationId <- obj .: "location_id"
    platformId <- obj .: "platform_id"
    subTotal <- obj .: "sub_total"
    taxAmount <- obj .: "tax_amount"
    taxRateId <- obj .: "tax_rate_id"
    totalAmount <- obj .: "total_amount"
    type_ <- obj .: "type"
    pure $ LineItems12{..}

instance ToJSON LineItems12 where
  toJSON LineItems12{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "class_id" .= classId,
      "description" .= description,
      "discount_amount" .= discountAmount,
      "discount_percentage" .= discountPercentage,
      "item" .= item,
      "location_id" .= locationId,
      "platform_id" .= platformId,
      "sub_total" .= subTotal,
      "tax_amount" .= taxAmount,
      "tax_rate_id" .= taxRateId,
      "total_amount" .= totalAmount,
      "type" .= type_
    ]
