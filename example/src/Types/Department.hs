{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Department where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data Department = Department
  { createdAt :: Maybe Text
  , hasChildren :: Maybe Bool
  , id :: Text
  , lastSyncedAt :: Text
  , name :: Maybe Text
  , parentId :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , status :: Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Department where
  parseJSON = withObject "Department" $ \obj -> do
    createdAt <- obj .: "created_at"
    hasChildren <- obj .: "has_children"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    name <- obj .: "name"
    parentId <- obj .: "parent_id"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    status <- obj .: "status"
    updatedAt <- obj .: "updated_at"
    pure $ Department{..}

instance ToJSON Department where
  toJSON Department{..} =
    object [
      "created_at" .= createdAt,
      "has_children" .= hasChildren,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "name" .= name,
      "parent_id" .= parentId,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "status" .= status,
      "updated_at" .= updatedAt
    ]
