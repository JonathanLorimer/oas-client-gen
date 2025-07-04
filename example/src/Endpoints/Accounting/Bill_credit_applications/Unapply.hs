{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bill_credit_applications.Unapply where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.BillCreditUnapplication (BillCreditUnapplication)
import Types.BillCreditUnapplicationRequest (BillCreditUnapplicationRequest)
import Types.BillCreditUnapplicationResponse (BillCreditUnapplicationResponse)
import Types.CreateBillCreditUnapplication (CreateBillCreditUnapplication)

postAccountingBillCreditApplicationsUnapply :: Endpoint () BillCreditUnapplicationRequest BillCreditUnapplicationResponse
postAccountingBillCreditApplicationsUnapply = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/bill_credit_applications"
      , "/unapply"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
