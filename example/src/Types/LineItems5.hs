{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields12 (AdditionalFields12)
import Types.Item3 (Item3)

data LineItems5 = LineItems5
  { accountId :: Text
  , additionalFields :: AdditionalFields12
  , classId :: Text
  , customerId :: Text
  , departmentId :: Text
  , description :: Text
  , discountAmount :: Double
  , discountItemId :: Text
  , item :: Item3
  , locationId :: Text
  , projectId :: Maybe Text
  , taxRateId :: Text
  , totalAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON LineItems5 where
  parseJSON = withObject "LineItems5" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    classId <- obj .: "class_id"
    customerId <- obj .: "customer_id"
    departmentId <- obj .: "department_id"
    description <- obj .: "description"
    discountAmount <- obj .: "discount_amount"
    discountItemId <- obj .: "discount_item_id"
    item <- obj .: "item"
    locationId <- obj .: "location_id"
    projectId <- obj .: "project_id"
    taxRateId <- obj .: "tax_rate_id"
    totalAmount <- obj .: "total_amount"
    pure $ LineItems5{..}

instance ToJSON LineItems5 where
  toJSON LineItems5{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "class_id" .= classId,
      "customer_id" .= customerId,
      "department_id" .= departmentId,
      "description" .= description,
      "discount_amount" .= discountAmount,
      "discount_item_id" .= discountItemId,
      "item" .= item,
      "location_id" .= locationId,
      "project_id" .= projectId,
      "tax_rate_id" .= taxRateId,
      "total_amount" .= totalAmount
    ]
