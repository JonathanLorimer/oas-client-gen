{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LineItems1 = LineItems1
  { accountId :: Text
  , classId :: Text
  , customerId :: Text
  , departmentId :: Text
  , description :: Text
  , locationId :: Text
  , totalAmount :: Double
  , vendorId :: Text
  }
  deriving (Show, Eq)

instance FromJSON LineItems1 where
  parseJSON = withObject "LineItems1" $ \obj -> do
    accountId <- obj .: "account_id"
    classId <- obj .: "class_id"
    customerId <- obj .: "customer_id"
    departmentId <- obj .: "department_id"
    description <- obj .: "description"
    locationId <- obj .: "location_id"
    totalAmount <- obj .: "total_amount"
    vendorId <- obj .: "vendor_id"
    pure $ LineItems1{..}

instance ToJSON LineItems1 where
  toJSON LineItems1{..} =
    object [
      "account_id" .= accountId,
      "class_id" .= classId,
      "customer_id" .= customerId,
      "department_id" .= departmentId,
      "description" .= description,
      "location_id" .= locationId,
      "total_amount" .= totalAmount,
      "vendor_id" .= vendorId
    ]
