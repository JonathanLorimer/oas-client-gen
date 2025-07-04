{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.HrisDepartment where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data HrisDepartment = HrisDepartment
  { createdAt :: Maybe Text
  , customFields :: Map Text Value
  , description :: Maybe Text
  , id :: Text
  , lastSyncedAt :: Text
  , managerId :: Maybe Text
  , name :: Text
  , parentDepartmentId :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON HrisDepartment where
  parseJSON = withObject "HrisDepartment" $ \obj -> do
    createdAt <- obj .: "created_at"
    customFields <- obj .: "custom_fields"
    description <- obj .: "description"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    managerId <- obj .: "manager_id"
    name <- obj .: "name"
    parentDepartmentId <- obj .: "parent_department_id"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    updatedAt <- obj .: "updated_at"
    pure $ HrisDepartment{..}

instance ToJSON HrisDepartment where
  toJSON HrisDepartment{..} =
    object [
      "created_at" .= createdAt,
      "custom_fields" .= customFields,
      "description" .= description,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "manager_id" .= managerId,
      "name" .= name,
      "parent_department_id" .= parentDepartmentId,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "updated_at" .= updatedAt
    ]
