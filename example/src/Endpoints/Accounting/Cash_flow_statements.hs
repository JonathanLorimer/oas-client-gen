{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Cash_flow_statements where

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

import Types.AsyncResponse14 (AsyncResponse14)
import Types.CashFlowStatement (CashFlowStatement)
import Types.ListListCashFlowStatementResponseResponse (ListListCashFlowStatementResponseResponse)
import Types.ListListCashFlowStatementResponseResponse1 (ListListCashFlowStatementResponseResponse1)
import Types.ListListCashFlowStatementResponseResponse (ListListCashFlowStatementResponseResponse)

getAccountingCashFlowStatements :: Endpoint () () ListListCashFlowStatementResponseResponse
getAccountingCashFlowStatements = Endpoint
  { method = HTTP.GET
  , path = const $ fold
      [ "/accounting"
      , "/cash_flow_statements"
      ]
  , toRequestBody = const L.empty
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
