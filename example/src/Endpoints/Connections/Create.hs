{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Connections.Create where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.Connection2 (Connection2)
import Types.ConnectionResponse (ConnectionResponse)
import Types.CreateConnectionBody (CreateConnectionBody)
import Types.CreateConnectionBody1 (CreateConnectionBody1)
import Types.CreateConnectionBody10 (CreateConnectionBody10)
import Types.CreateConnectionBody11 (CreateConnectionBody11)
import Types.CreateConnectionBody12 (CreateConnectionBody12)
import Types.CreateConnectionBody13 (CreateConnectionBody13)
import Types.CreateConnectionBody14 (CreateConnectionBody14)
import Types.CreateConnectionBody15 (CreateConnectionBody15)
import Types.CreateConnectionBody16 (CreateConnectionBody16)
import Types.CreateConnectionBody17 (CreateConnectionBody17)
import Types.CreateConnectionBody2 (CreateConnectionBody2)
import Types.CreateConnectionBody3 (CreateConnectionBody3)
import Types.CreateConnectionBody4 (CreateConnectionBody4)
import Types.CreateConnectionBody5 (CreateConnectionBody5)
import Types.CreateConnectionBody6 (CreateConnectionBody6)
import Types.CreateConnectionBody7 (CreateConnectionBody7)
import Types.CreateConnectionBody8 (CreateConnectionBody8)
import Types.CreateConnectionBody9 (CreateConnectionBody9)
import Types.CreateConnectionBody (CreateConnectionBody)
import Types.CreateConnectionBody_1 (CreateConnectionBody_1)
import Types.CreateConnectionBody_3 (CreateConnectionBody_3)

postConnectionsCreate :: Endpoint () CreateConnectionBody ConnectionResponse
postConnectionsCreate = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/connections"
      , "/create"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
