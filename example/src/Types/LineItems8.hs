{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields18 (AdditionalFields18)

data LineItems8 = LineItems8
  { accountId :: Maybe Text
  , additionalFields :: AdditionalFields18
  , classId :: Maybe Text
  , customerId :: Maybe Text
  , departmentId :: Maybe Text
  , description :: Maybe Text
  , locationId :: Maybe Text
  , projectId :: Maybe Text
  , taxRateId :: Maybe Text
  , totalAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON LineItems8 where
  parseJSON = withObject "LineItems8" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    classId <- obj .: "class_id"
    customerId <- obj .: "customer_id"
    departmentId <- obj .: "department_id"
    description <- obj .: "description"
    locationId <- obj .: "location_id"
    projectId <- obj .: "project_id"
    taxRateId <- obj .: "tax_rate_id"
    totalAmount <- obj .: "total_amount"
    pure $ LineItems8{..}

instance ToJSON LineItems8 where
  toJSON LineItems8{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "class_id" .= classId,
      "customer_id" .= customerId,
      "department_id" .= departmentId,
      "description" .= description,
      "location_id" .= locationId,
      "project_id" .= projectId,
      "tax_rate_id" .= taxRateId,
      "total_amount" .= totalAmount
    ]
