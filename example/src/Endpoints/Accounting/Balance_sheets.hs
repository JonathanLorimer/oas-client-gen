{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Balance_sheets where

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

import Types.AsyncResponse1 (AsyncResponse1)
import Types.BalanceSheet (BalanceSheet)
import Types.GeneralLedgerLineItem (GeneralLedgerLineItem)
import Types.ListBalanceSheetResultResponse (ListBalanceSheetResultResponse)
import Types.ListBalanceSheetResultResponse1 (ListBalanceSheetResultResponse1)
import Types.ListBalanceSheetResultResponse (ListBalanceSheetResultResponse)

getAccountingBalanceSheets :: Endpoint () () ListBalanceSheetResultResponse
getAccountingBalanceSheets = Endpoint
  { method = HTTP.GET
  , path = const $ fold
      [ "/accounting"
      , "/balance_sheets"
      ]
  , toRequestBody = const L.empty
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
