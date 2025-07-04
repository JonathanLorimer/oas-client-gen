{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Connection1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Connection1 = Connection1
  { createdAt :: Text
  , disabled :: Bool
  , estimatedCompletedAt :: Maybe Text
  , id :: Text
  , initialOrdersSyncedCount :: Double
  , lastSyncCompletedAt :: Maybe Text
  , lastSyncStartedAt :: Maybe Text
  , linkUrl :: Text
  , needsUpdate :: Bool
  , newestOrderDate :: Maybe Text
  , oldestOrderDate :: Maybe Text
  , platform :: Text
  , storeDomain :: Maybe Text
  , storeName :: Maybe Text
  , storeUniqueId :: Text
  , unavailableObjects :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Connection1 where
  parseJSON = withObject "Connection1" $ \obj -> do
    createdAt <- obj .: "created_at"
    disabled <- obj .: "disabled"
    estimatedCompletedAt <- obj .: "estimated_completed_at"
    id <- obj .: "id"
    initialOrdersSyncedCount <- obj .: "initial_orders_synced_count"
    lastSyncCompletedAt <- obj .: "last_sync_completed_at"
    lastSyncStartedAt <- obj .: "last_sync_started_at"
    linkUrl <- obj .: "link_url"
    needsUpdate <- obj .: "needs_update"
    newestOrderDate <- obj .: "newest_order_date"
    oldestOrderDate <- obj .: "oldest_order_date"
    platform <- obj .: "platform"
    storeDomain <- obj .: "store_domain"
    storeName <- obj .: "store_name"
    storeUniqueId <- obj .: "store_unique_id"
    unavailableObjects <- obj .: "unavailable_objects"
    pure $ Connection1{..}

instance ToJSON Connection1 where
  toJSON Connection1{..} =
    object [
      "created_at" .= createdAt,
      "disabled" .= disabled,
      "estimated_completed_at" .= estimatedCompletedAt,
      "id" .= id,
      "initial_orders_synced_count" .= initialOrdersSyncedCount,
      "last_sync_completed_at" .= lastSyncCompletedAt,
      "last_sync_started_at" .= lastSyncStartedAt,
      "link_url" .= linkUrl,
      "needs_update" .= needsUpdate,
      "newest_order_date" .= newestOrderDate,
      "oldest_order_date" .= oldestOrderDate,
      "platform" .= platform,
      "store_domain" .= storeDomain,
      "store_name" .= storeName,
      "store_unique_id" .= storeUniqueId,
      "unavailable_objects" .= unavailableObjects
    ]
