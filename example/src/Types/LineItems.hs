{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LineItems = LineItems
  { accountId :: Maybe Text
  , classId :: Maybe Text
  , customerId :: Maybe Text
  , departmentId :: Maybe Text
  , description :: Maybe Text
  , locationId :: Maybe Text
  , platformId :: Maybe Text
  , totalAmount :: Double
  , vendorId :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON LineItems where
  parseJSON = withObject "LineItems" $ \obj -> do
    accountId <- obj .: "account_id"
    classId <- obj .: "class_id"
    customerId <- obj .: "customer_id"
    departmentId <- obj .: "department_id"
    description <- obj .: "description"
    locationId <- obj .: "location_id"
    platformId <- obj .: "platform_id"
    totalAmount <- obj .: "total_amount"
    vendorId <- obj .: "vendor_id"
    pure $ LineItems{..}

instance ToJSON LineItems where
  toJSON LineItems{..} =
    object [
      "account_id" .= accountId,
      "class_id" .= classId,
      "customer_id" .= customerId,
      "department_id" .= departmentId,
      "description" .= description,
      "location_id" .= locationId,
      "platform_id" .= platformId,
      "total_amount" .= totalAmount,
      "vendor_id" .= vendorId
    ]
