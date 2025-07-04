{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Customer_refunds where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields15 (AdditionalFields15)
import Types.AdditionalFields16 (AdditionalFields16)
import Types.AsyncResponse16 (AsyncResponse16)
import Types.CreateAccountingCustomerRefund (CreateAccountingCustomerRefund)
import Types.CreateAccountingCustomerRefundResponse (CreateAccountingCustomerRefundResponse)
import Types.CreateAccountingCustomerRefundResponse1 (CreateAccountingCustomerRefundResponse1)
import Types.CreateCreateAccountingCustomerRefundRequest (CreateCreateAccountingCustomerRefundRequest)
import Types.Item5 (Item5)
import Types.LineItems7 (LineItems7)
import Types.CreateAccountingCustomerRefundResponse (CreateAccountingCustomerRefundResponse)

postAccountingCustomerRefunds :: Endpoint () CreateCreateAccountingCustomerRefundRequest CreateAccountingCustomerRefundResponse
postAccountingCustomerRefunds = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/customer_refunds"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
