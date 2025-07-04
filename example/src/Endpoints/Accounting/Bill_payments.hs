{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bill_payments where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields8 (AdditionalFields8)
import Types.AsyncResponse10 (AsyncResponse10)
import Types.CreateBillPayment (CreateBillPayment)
import Types.CreateBillPaymentResponse (CreateBillPaymentResponse)
import Types.CreateBillPaymentResponse1 (CreateBillPaymentResponse1)
import Types.CreateCreateBillPaymentRequest (CreateCreateBillPaymentRequest)
import Types.LinkedBills3 (LinkedBills3)
import Types.CreateBillPaymentResponse (CreateBillPaymentResponse)

postAccountingBillPayments :: Endpoint () CreateCreateBillPaymentRequest CreateBillPaymentResponse
postAccountingBillPayments = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/bill_payments"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
