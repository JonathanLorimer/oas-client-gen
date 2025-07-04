{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Project where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data Project = Project
  { createdAt :: Maybe Text
  , id :: Text
  , lastSyncedAt :: Text
  , name :: Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , projectCategory :: Maybe Text
  , status :: Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Project where
  parseJSON = withObject "Project" $ \obj -> do
    createdAt <- obj .: "created_at"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    name <- obj .: "name"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    projectCategory <- obj .: "project_category"
    status <- obj .: "status"
    updatedAt <- obj .: "updated_at"
    pure $ Project{..}

instance ToJSON Project where
  toJSON Project{..} =
    object [
      "created_at" .= createdAt,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "name" .= name,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "project_category" .= projectCategory,
      "status" .= status,
      "updated_at" .= updatedAt
    ]
