{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems16 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Item10 (Item10)

data LineItems16 = LineItems16
  { accountId :: Maybe Text
  , classId :: Maybe Text
  , departmentId :: Maybe Text
  , description :: Maybe Text
  , item :: Maybe Item10
  , taxRateId :: Maybe Text
  , totalAmount :: Maybe Double
  }
  deriving (Show, Eq)

instance FromJSON LineItems16 where
  parseJSON = withObject "LineItems16" $ \obj -> do
    accountId <- obj .: "account_id"
    classId <- obj .: "class_id"
    departmentId <- obj .: "department_id"
    description <- obj .: "description"
    item <- obj .: "item"
    taxRateId <- obj .: "tax_rate_id"
    totalAmount <- obj .: "total_amount"
    pure $ LineItems16{..}

instance ToJSON LineItems16 where
  toJSON LineItems16{..} =
    object [
      "account_id" .= accountId,
      "class_id" .= classId,
      "department_id" .= departmentId,
      "description" .= description,
      "item" .= item,
      "tax_rate_id" .= taxRateId,
      "total_amount" .= totalAmount
    ]
