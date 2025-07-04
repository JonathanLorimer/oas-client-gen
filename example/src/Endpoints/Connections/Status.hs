{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Connections.Status where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP
import Data.Map (Map)
import Data.Aeson (Value)

import Types.Batches (Batches)
import Types.Config (Config)
import Types.Connection3 (Connection3)
import Types.DisabledStatus (DisabledStatus)
import Types.Entities (Entities)
import Types.ExpectedEntityCounts (ExpectedEntityCounts)
import Types.GetConnectionStatusResponse (GetConnectionStatusResponse)
import Types.HistoricalSyncStatus (HistoricalSyncStatus)
import Types.NeedsUpdateStatus (NeedsUpdateStatus)
import Types.Orders (Orders)
import Types.Products (Products)
import Types.Status (Status)
import Types.Variants (Variants)
import Types.Orders (Orders)
import Types.Products (Products)

getConnectionsStatus :: Endpoint () () GetConnectionStatusResponse
getConnectionsStatus = Endpoint
  { method = HTTP.GET
  , path = const $ fold
      [ "/connections"
      , "/status"
      ]
  , toRequestBody = const L.empty
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
