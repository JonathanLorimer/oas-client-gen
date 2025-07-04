{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Income_statements where

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

import Types.AsyncResponse22 (AsyncResponse22)
import Types.IncomeStatement (IncomeStatement)
import Types.ListListIncomeStatementResponseResponse (ListListIncomeStatementResponseResponse)
import Types.ListListIncomeStatementResponseResponse1 (ListListIncomeStatementResponseResponse1)
import Types.ListListIncomeStatementResponseResponse (ListListIncomeStatementResponseResponse)

getAccountingIncomeStatements :: Endpoint () () ListListIncomeStatementResponseResponse
getAccountingIncomeStatements = Endpoint
  { method = HTTP.GET
  , path = const $ fold
      [ "/accounting"
      , "/income_statements"
      ]
  , toRequestBody = const L.empty
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
