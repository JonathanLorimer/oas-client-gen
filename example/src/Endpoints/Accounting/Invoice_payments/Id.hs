{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Invoice_payments.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AsyncDeleteInvoicePaymentResponse (AsyncDeleteInvoicePaymentResponse)
import Types.AsyncDeleteInvoicePaymentResponse1 (AsyncDeleteInvoicePaymentResponse1)
import Types.AsyncResponse27 (AsyncResponse27)
import Types.AsyncDeleteInvoicePaymentResponse (AsyncDeleteInvoicePaymentResponse)

data AccountingInvoicePaymentsByIdPathParams = AccountingInvoicePaymentsByIdPathParams
  { id :: Text }

deleteAccountingInvoicePaymentsById :: Endpoint AccountingInvoicePaymentsByIdPathParams AsyncWriteParams AsyncDeleteInvoicePaymentResponse
deleteAccountingInvoicePaymentsById = Endpoint
  { method = HTTP.DELETE
  , path = \pathParams -> fold
      [ "/accounting"
      , "/invoice_payments"
      , "/" <> pathParams.id
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
