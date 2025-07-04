{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Invoice_credit_applications where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AsyncResponse23 (AsyncResponse23)
import Types.CreateCreateInvoiceCreditApplicationRequest (CreateCreateInvoiceCreditApplicationRequest)
import Types.CreateInvoiceCreditApplication (CreateInvoiceCreditApplication)
import Types.CreateInvoiceCreditApplicationResponse (CreateInvoiceCreditApplicationResponse)
import Types.CreateInvoiceCreditApplicationResponse1 (CreateInvoiceCreditApplicationResponse1)
import Types.InvoiceCreditApplication (InvoiceCreditApplication)
import Types.LinkedInvoices (LinkedInvoices)
import Types.CreateInvoiceCreditApplicationResponse (CreateInvoiceCreditApplicationResponse)

postAccountingInvoiceCreditApplications :: Endpoint () CreateCreateInvoiceCreditApplicationRequest CreateInvoiceCreditApplicationResponse
postAccountingInvoiceCreditApplications = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/invoice_credit_applications"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
