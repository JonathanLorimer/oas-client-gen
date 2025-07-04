{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields32 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields32 = AdditionalFields32
  { classId :: Maybe Text
  , customerId :: Maybe Text
  , departmentId :: Maybe Text
  , locationId :: Maybe Text
  , projectId :: Maybe Text
  , subsidiaryId :: Maybe Text
  , taxAccountId :: Maybe Text
  , vendorId :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields32 where
  parseJSON = withObject "AdditionalFields32" $ \obj -> do
    classId <- obj .: "class_id"
    customerId <- obj .: "customer_id"
    departmentId <- obj .: "department_id"
    locationId <- obj .: "location_id"
    projectId <- obj .: "project_id"
    subsidiaryId <- obj .: "subsidiary_id"
    taxAccountId <- obj .: "tax_account_id"
    vendorId <- obj .: "vendor_id"
    pure $ AdditionalFields32{..}

instance ToJSON AdditionalFields32 where
  toJSON AdditionalFields32{..} =
    object [
      "class_id" .= classId,
      "customer_id" .= customerId,
      "department_id" .= departmentId,
      "location_id" .= locationId,
      "project_id" .= projectId,
      "subsidiary_id" .= subsidiaryId,
      "tax_account_id" .= taxAccountId,
      "vendor_id" .= vendorId
    ]
