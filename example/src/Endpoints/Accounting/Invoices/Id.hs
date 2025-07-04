{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Invoices.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AsyncDeleteInvoiceResponse (AsyncDeleteInvoiceResponse)
import Types.AsyncDeleteInvoiceResponse1 (AsyncDeleteInvoiceResponse1)
import Types.AsyncResponse29 (AsyncResponse29)
import Types.AsyncDeleteInvoiceResponse (AsyncDeleteInvoiceResponse)

data AccountingInvoicesByIdPathParams = AccountingInvoicesByIdPathParams
  { id :: Text }

deleteAccountingInvoicesById :: Endpoint AccountingInvoicesByIdPathParams AsyncWriteParams AsyncDeleteInvoiceResponse
deleteAccountingInvoicesById = Endpoint
  { method = HTTP.DELETE
  , path = \pathParams -> fold
      [ "/accounting"
      , "/invoices"
      , "/" <> pathParams.id
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
