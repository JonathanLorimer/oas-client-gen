{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Invoices.Id.Pdf where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.Invoice1 (Invoice1)
import Types.InvoiceTransactionPdfLinkResponse (InvoiceTransactionPdfLinkResponse)

data AccountingInvoicesByIdPdfPathParams = AccountingInvoicesByIdPdfPathParams
  { id :: Text }

getAccountingInvoicesByIdPdf :: Endpoint AccountingInvoicesByIdPdfPathParams () InvoiceTransactionPdfLinkResponse
getAccountingInvoicesByIdPdf = Endpoint
  { method = HTTP.GET
  , path = \pathParams -> fold
      [ "/accounting"
      , "/invoices"
      , "/" <> pathParams.id
      , "/pdf"
      ]
  , toRequestBody = const L.empty
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
