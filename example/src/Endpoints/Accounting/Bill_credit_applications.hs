{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bill_credit_applications where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields4 (AdditionalFields4)
import Types.AsyncResponse8 (AsyncResponse8)
import Types.BillCreditApplication (BillCreditApplication)
import Types.CreateBillCreditApplication (CreateBillCreditApplication)
import Types.CreateBillCreditApplicationResponse (CreateBillCreditApplicationResponse)
import Types.CreateBillCreditApplicationResponse1 (CreateBillCreditApplicationResponse1)
import Types.CreateCreateBillCreditApplicationRequest (CreateCreateBillCreditApplicationRequest)
import Types.LinkedBills (LinkedBills)
import Types.CreateBillCreditApplicationResponse (CreateBillCreditApplicationResponse)

postAccountingBillCreditApplications :: Endpoint () CreateCreateBillCreditApplicationRequest CreateBillCreditApplicationResponse
postAccountingBillCreditApplications = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/bill_credit_applications"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
