{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Task where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data Task = Task
  { createdAt :: Maybe Text
  , id :: Text
  , lastSyncedAt :: Text
  , name :: Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , status :: Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Task where
  parseJSON = withObject "Task" $ \obj -> do
    createdAt <- obj .: "created_at"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    name <- obj .: "name"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    status <- obj .: "status"
    updatedAt <- obj .: "updated_at"
    pure $ Task{..}

instance ToJSON Task where
  toJSON Task{..} =
    object [
      "created_at" .= createdAt,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "name" .= name,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "status" .= status,
      "updated_at" .= updatedAt
    ]
