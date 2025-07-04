{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Invoice_payments where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields25 (AdditionalFields25)
import Types.AsyncResponse26 (AsyncResponse26)
import Types.CreateCreateInvoicePaymentRequest (CreateCreateInvoicePaymentRequest)
import Types.CreateInvoicePayment (CreateInvoicePayment)
import Types.CreateInvoicePaymentResponse (CreateInvoicePaymentResponse)
import Types.CreateInvoicePaymentResponse1 (CreateInvoicePaymentResponse1)
import Types.LinkedInvoices3 (LinkedInvoices3)
import Types.CreateInvoicePaymentResponse (CreateInvoicePaymentResponse)

postAccountingInvoicePayments :: Endpoint () CreateCreateInvoicePaymentRequest CreateInvoicePaymentResponse
postAccountingInvoicePayments = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/invoice_payments"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
