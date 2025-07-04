{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdsAccount where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data AdsAccount = AdsAccount
  { createdAt :: Maybe Text
  , id :: Text
  , lastSyncedAt :: Text
  , name :: Maybe Text
  , parentId :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON AdsAccount where
  parseJSON = withObject "AdsAccount" $ \obj -> do
    createdAt <- obj .: "created_at"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    name <- obj .: "name"
    parentId <- obj .: "parent_id"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    updatedAt <- obj .: "updated_at"
    pure $ AdsAccount{..}

instance ToJSON AdsAccount where
  toJSON AdsAccount{..} =
    object [
      "created_at" .= createdAt,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "name" .= name,
      "parent_id" .= parentId,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "updated_at" .= updatedAt
    ]
