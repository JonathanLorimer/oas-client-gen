{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields34 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields34 = AdditionalFields34
  { classId :: Text
  , customerId :: Text
  , departmentId :: Text
  , locationId :: Text
  , projectId :: Text
  , subsidiaryId :: Maybe Text
  , taxAccountId :: Maybe Text
  , vendorId :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields34 where
  parseJSON = withObject "AdditionalFields34" $ \obj -> do
    classId <- obj .: "class_id"
    customerId <- obj .: "customer_id"
    departmentId <- obj .: "department_id"
    locationId <- obj .: "location_id"
    projectId <- obj .: "project_id"
    subsidiaryId <- obj .: "subsidiary_id"
    taxAccountId <- obj .: "tax_account_id"
    vendorId <- obj .: "vendor_id"
    pure $ AdditionalFields34{..}

instance ToJSON AdditionalFields34 where
  toJSON AdditionalFields34{..} =
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
