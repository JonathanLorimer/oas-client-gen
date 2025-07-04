{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.GetConnectionStatusResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Batches (Batches)
import Types.Config (Config)
import Types.Connection3 (Connection3)
import Types.DisabledStatus (DisabledStatus)
import Types.Entities (Entities)
import Types.ExpectedEntityCounts (ExpectedEntityCounts)
import Types.HistoricalSyncStatus (HistoricalSyncStatus)
import Types.NeedsUpdateStatus (NeedsUpdateStatus)
import Types.Orders (Orders)
import Types.Products (Products)
import Types.Status (Status)
import Types.Variants (Variants)
import Types.Orders (Orders)
import Types.Products (Products)

data GetConnectionStatusResponse = GetConnectionStatusResponse
  { connection :: Connection3
  , status :: Status
  }
  deriving (Show, Eq)

instance FromJSON GetConnectionStatusResponse where
  parseJSON = withObject "GetConnectionStatusResponse" $ \obj -> do
    connection <- obj .: "connection"
    status <- obj .: "status"
    pure $ GetConnectionStatusResponse{..}

instance ToJSON GetConnectionStatusResponse where
  toJSON GetConnectionStatusResponse{..} =
    object [
      "connection" .= connection,
      "status" .= status
    ]
