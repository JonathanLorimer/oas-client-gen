{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Status where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Batches (Batches)
import Types.Config (Config)
import Types.DisabledStatus (DisabledStatus)
import Types.Entities (Entities)
import Types.ExpectedEntityCounts (ExpectedEntityCounts)
import Types.HistoricalSyncStatus (HistoricalSyncStatus)
import Types.NeedsUpdateStatus (NeedsUpdateStatus)
import Types.Orders (Orders)
import Types.Products (Products)
import Types.Variants (Variants)
import Types.Orders (Orders)
import Types.Products (Products)

data Status = Status
  { createdAt :: Text
  , disabledStatus :: DisabledStatus
  , historicalSyncStatus :: HistoricalSyncStatus
  , isHealthy :: Bool
  , isReady :: Bool
  , lastSyncCompletedAt :: Maybe Text
  , linkUrl :: Text
  , needsUpdateStatus :: NeedsUpdateStatus
  , platform :: Text
  }
  deriving (Show, Eq)

instance FromJSON Status where
  parseJSON = withObject "Status" $ \obj -> do
    createdAt <- obj .: "created_at"
    disabledStatus <- obj .: "disabled_status"
    historicalSyncStatus <- obj .: "historical_sync_status"
    isHealthy <- obj .: "is_healthy"
    isReady <- obj .: "is_ready"
    lastSyncCompletedAt <- obj .: "last_sync_completed_at"
    linkUrl <- obj .: "link_url"
    needsUpdateStatus <- obj .: "needs_update_status"
    platform <- obj .: "platform"
    pure $ Status{..}

instance ToJSON Status where
  toJSON Status{..} =
    object [
      "created_at" .= createdAt,
      "disabled_status" .= disabledStatus,
      "historical_sync_status" .= historicalSyncStatus,
      "is_healthy" .= isHealthy,
      "is_ready" .= isReady,
      "last_sync_completed_at" .= lastSyncCompletedAt,
      "link_url" .= linkUrl,
      "needs_update_status" .= needsUpdateStatus,
      "platform" .= platform
    ]
