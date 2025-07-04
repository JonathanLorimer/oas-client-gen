{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Location where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Subsidiaries2 (Subsidiaries2)

data Location = Location
  { createdAt :: Maybe Text
  , hasChildren :: Maybe Bool
  , id :: Text
  , lastSyncedAt :: Text
  , name :: Maybe Text
  , parentId :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , status :: Text
  , subsidiaries :: [Subsidiaries2]
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Location where
  parseJSON = withObject "Location" $ \obj -> do
    createdAt <- obj .: "created_at"
    hasChildren <- obj .: "has_children"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    name <- obj .: "name"
    parentId <- obj .: "parent_id"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    status <- obj .: "status"
    subsidiaries <- obj .: "subsidiaries"
    updatedAt <- obj .: "updated_at"
    pure $ Location{..}

instance ToJSON Location where
  toJSON Location{..} =
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
      "subsidiaries" .= subsidiaries,
      "updated_at" .= updatedAt
    ]
