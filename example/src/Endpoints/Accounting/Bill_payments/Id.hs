{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bill_payments.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AsyncDeleteBillPaymentResponse (AsyncDeleteBillPaymentResponse)
import Types.AsyncDeleteBillPaymentResponse1 (AsyncDeleteBillPaymentResponse1)
import Types.AsyncResponse11 (AsyncResponse11)
import Types.AsyncDeleteBillPaymentResponse (AsyncDeleteBillPaymentResponse)

data AccountingBillPaymentsByIdPathParams = AccountingBillPaymentsByIdPathParams
  { id :: Text }

deleteAccountingBillPaymentsById :: Endpoint AccountingBillPaymentsByIdPathParams AsyncWriteParams AsyncDeleteBillPaymentResponse
deleteAccountingBillPaymentsById = Endpoint
  { method = HTTP.DELETE
  , path = \pathParams -> fold
      [ "/accounting"
      , "/bill_payments"
      , "/" <> pathParams.id
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
