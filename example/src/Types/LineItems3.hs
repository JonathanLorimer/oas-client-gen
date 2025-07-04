{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Item1 (Item1)

data LineItems3 = LineItems3
  { accountId :: Text
  , classId :: Text
  , customerId :: Text
  , departmentId :: Text
  , description :: Text
  , item :: Item1
  , locationId :: Text
  , taxRateId :: Text
  , totalAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON LineItems3 where
  parseJSON = withObject "LineItems3" $ \obj -> do
    accountId <- obj .: "account_id"
    classId <- obj .: "class_id"
    customerId <- obj .: "customer_id"
    departmentId <- obj .: "department_id"
    description <- obj .: "description"
    item <- obj .: "item"
    locationId <- obj .: "location_id"
    taxRateId <- obj .: "tax_rate_id"
    totalAmount <- obj .: "total_amount"
    pure $ LineItems3{..}

instance ToJSON LineItems3 where
  toJSON LineItems3{..} =
    object [
      "account_id" .= accountId,
      "class_id" .= classId,
      "customer_id" .= customerId,
      "department_id" .= departmentId,
      "description" .= description,
      "item" .= item,
      "location_id" .= locationId,
      "tax_rate_id" .= taxRateId,
      "total_amount" .= totalAmount
    ]
