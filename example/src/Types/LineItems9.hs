{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems9 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields20 (AdditionalFields20)
import Types.Item6 (Item6)

data LineItems9 = LineItems9
  { accountId :: Text
  , additionalFields :: AdditionalFields20
  , classId :: Text
  , customerId :: Text
  , departmentId :: Text
  , description :: Text
  , locationId :: Text
  , projectId :: Maybe Text
  , taxRateId :: Text
  , totalAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON LineItems9 where
  parseJSON = withObject "LineItems9" $ \obj -> do
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
    pure $ LineItems9{..}

instance ToJSON LineItems9 where
  toJSON LineItems9{..} =
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
