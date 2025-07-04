{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Tasks.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.TaskResponseWithConnection (TaskResponseWithConnection)

data AccountingTasksByIdPathParams = AccountingTasksByIdPathParams
  { id :: Text }

getAccountingTasksById :: Endpoint AccountingTasksByIdPathParams () TaskResponseWithConnection
getAccountingTasksById = Endpoint
  { method = HTTP.GET
  , path = \pathParams -> fold
      [ "/accounting"
      , "/tasks"
      , "/" <> pathParams.id
      ]
  , toRequestBody = const L.empty
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
