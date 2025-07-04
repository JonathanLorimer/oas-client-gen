{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.HrisEmployee where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data HrisEmployee = HrisEmployee
  { createdAt :: Maybe Text
  , customFields :: Map Text Value
  , departmentId :: Maybe Text
  , employeeNumber :: Maybe Text
  , firstName :: Text
  , hireDate :: Maybe Text
  , id :: Text
  , lastName :: Maybe Text
  , lastSyncedAt :: Text
  , managerId :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , position :: Maybe Text
  , salary :: Maybe Double
  , status :: Text
  , terminationDate :: Maybe Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON HrisEmployee where
  parseJSON = withObject "HrisEmployee" $ \obj -> do
    createdAt <- obj .: "created_at"
    customFields <- obj .: "custom_fields"
    departmentId <- obj .: "department_id"
    employeeNumber <- obj .: "employee_number"
    firstName <- obj .: "first_name"
    hireDate <- obj .: "hire_date"
    id <- obj .: "id"
    lastName <- obj .: "last_name"
    lastSyncedAt <- obj .: "last_synced_at"
    managerId <- obj .: "manager_id"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    position <- obj .: "position"
    salary <- obj .: "salary"
    status <- obj .: "status"
    terminationDate <- obj .: "termination_date"
    updatedAt <- obj .: "updated_at"
    pure $ HrisEmployee{..}

instance ToJSON HrisEmployee where
  toJSON HrisEmployee{..} =
    object [
      "created_at" .= createdAt,
      "custom_fields" .= customFields,
      "department_id" .= departmentId,
      "employee_number" .= employeeNumber,
      "first_name" .= firstName,
      "hire_date" .= hireDate,
      "id" .= id,
      "last_name" .= lastName,
      "last_synced_at" .= lastSyncedAt,
      "manager_id" .= managerId,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "position" .= position,
      "salary" .= salary,
      "status" .= status,
      "termination_date" .= terminationDate,
      "updated_at" .= updatedAt
    ]
