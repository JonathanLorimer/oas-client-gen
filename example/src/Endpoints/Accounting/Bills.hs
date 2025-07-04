{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bills where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields11 (AdditionalFields11)
import Types.AdditionalFields12 (AdditionalFields12)
import Types.AsyncResponse12 (AsyncResponse12)
import Types.CreateBill (CreateBill)
import Types.CreateBillResponse (CreateBillResponse)
import Types.CreateBillResponse1 (CreateBillResponse1)
import Types.CreateCreateBillRequest (CreateCreateBillRequest)
import Types.Item3 (Item3)
import Types.LineItems5 (LineItems5)
import Types.LinkedPurchaseOrders1 (LinkedPurchaseOrders1)
import Types.CreateBillResponse (CreateBillResponse)

postAccountingBills :: Endpoint () CreateCreateBillRequest CreateBillResponse
postAccountingBills = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/bills"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
