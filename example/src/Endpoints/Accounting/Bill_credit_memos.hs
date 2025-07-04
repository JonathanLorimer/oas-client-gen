{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bill_credit_memos where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields6 (AdditionalFields6)
import Types.AsyncResponse9 (AsyncResponse9)
import Types.CreateBillCreditMemo (CreateBillCreditMemo)
import Types.CreateBillCreditMemoResponse (CreateBillCreditMemoResponse)
import Types.CreateBillCreditMemoResponse1 (CreateBillCreditMemoResponse1)
import Types.CreateCreateBillCreditMemoRequest (CreateCreateBillCreditMemoRequest)
import Types.Item1 (Item1)
import Types.LineItems3 (LineItems3)
import Types.CreateBillCreditMemoResponse (CreateBillCreditMemoResponse)

postAccountingBillCreditMemos :: Endpoint () CreateCreateBillCreditMemoRequest CreateBillCreditMemoResponse
postAccountingBillCreditMemos = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/bill_credit_memos"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
