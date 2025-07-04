{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Connections.Incremental_sync where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.CreateConnectionIncrementalSyncRequest (CreateConnectionIncrementalSyncRequest)
import Types.CreateConnectionIncrementalSyncResponse (CreateConnectionIncrementalSyncResponse)

postConnectionsIncrementalSync :: Endpoint () CreateConnectionIncrementalSyncRequest CreateConnectionIncrementalSyncResponse
postConnectionsIncrementalSync = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/connections"
      , "/incremental_sync"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
