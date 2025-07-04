{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bill_credit_memos.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.BillCreditMemoResponseWithConnection (BillCreditMemoResponseWithConnection)

data AccountingBillCreditMemosByIdPathParams = AccountingBillCreditMemosByIdPathParams
  { id :: Text }

getAccountingBillCreditMemosById :: Endpoint AccountingBillCreditMemosByIdPathParams () BillCreditMemoResponseWithConnection
getAccountingBillCreditMemosById = Endpoint
  { method = HTTP.GET
  , path = \pathParams -> fold
      [ "/accounting"
      , "/bill_credit_memos"
      , "/" <> pathParams.id
      ]
  , toRequestBody = const L.empty
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
