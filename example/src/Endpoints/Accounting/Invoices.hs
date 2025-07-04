{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Invoices where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields28 (AdditionalFields28)
import Types.AdditionalFields29 (AdditionalFields29)
import Types.Addresses3 (Addresses3)
import Types.AsyncResponse28 (AsyncResponse28)
import Types.CreateCreateInvoiceRequest (CreateCreateInvoiceRequest)
import Types.CreateInvoice (CreateInvoice)
import Types.CreateInvoiceResponse (CreateInvoiceResponse)
import Types.CreateInvoiceResponse1 (CreateInvoiceResponse1)
import Types.Item9 (Item9)
import Types.LineItems13 (LineItems13)
import Types.LinkedSalesOrder (LinkedSalesOrder)
import Types.CreateInvoiceResponse (CreateInvoiceResponse)

postAccountingInvoices :: Endpoint () CreateCreateInvoiceRequest CreateInvoiceResponse
postAccountingInvoices = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/invoices"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
