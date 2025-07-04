{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields5 (AdditionalFields5)
import Types.Item (Item)

data LineItems2 = LineItems2
  { accountId :: Maybe Text
  , additionalFields :: AdditionalFields5
  , classId :: Maybe Text
  , customerId :: Maybe Text
  , departmentId :: Maybe Text
  , description :: Maybe Text
  , discountAmount :: Maybe Double
  , discountPercentage :: Maybe Double
  , item :: Maybe Item
  , locationId :: Maybe Text
  , platformId :: Maybe Text
  , projectId :: Maybe Text
  , subTotal :: Maybe Double
  , taxAmount :: Maybe Double
  , taxRateId :: Maybe Text
  , totalAmount :: Maybe Double
  }
  deriving (Show, Eq)

instance FromJSON LineItems2 where
  parseJSON = withObject "LineItems2" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    classId <- obj .: "class_id"
    customerId <- obj .: "customer_id"
    departmentId <- obj .: "department_id"
    description <- obj .: "description"
    discountAmount <- obj .: "discount_amount"
    discountPercentage <- obj .: "discount_percentage"
    item <- obj .: "item"
    locationId <- obj .: "location_id"
    platformId <- obj .: "platform_id"
    projectId <- obj .: "project_id"
    subTotal <- obj .: "sub_total"
    taxAmount <- obj .: "tax_amount"
    taxRateId <- obj .: "tax_rate_id"
    totalAmount <- obj .: "total_amount"
    pure $ LineItems2{..}

instance ToJSON LineItems2 where
  toJSON LineItems2{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "class_id" .= classId,
      "customer_id" .= customerId,
      "department_id" .= departmentId,
      "description" .= description,
      "discount_amount" .= discountAmount,
      "discount_percentage" .= discountPercentage,
      "item" .= item,
      "location_id" .= locationId,
      "platform_id" .= platformId,
      "project_id" .= projectId,
      "sub_total" .= subTotal,
      "tax_amount" .= taxAmount,
      "tax_rate_id" .= taxRateId,
      "total_amount" .= totalAmount
    ]
