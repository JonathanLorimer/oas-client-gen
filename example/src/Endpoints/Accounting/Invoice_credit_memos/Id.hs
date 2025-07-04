{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Invoice_credit_memos.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AsyncDeleteInvoiceCreditMemoResponse (AsyncDeleteInvoiceCreditMemoResponse)
import Types.AsyncDeleteInvoiceCreditMemoResponse1 (AsyncDeleteInvoiceCreditMemoResponse1)
import Types.AsyncResponse25 (AsyncResponse25)
import Types.AsyncDeleteInvoiceCreditMemoResponse (AsyncDeleteInvoiceCreditMemoResponse)

data AccountingInvoiceCreditMemosByIdPathParams = AccountingInvoiceCreditMemosByIdPathParams
  { id :: Text }

deleteAccountingInvoiceCreditMemosById :: Endpoint AccountingInvoiceCreditMemosByIdPathParams AsyncWriteParams AsyncDeleteInvoiceCreditMemoResponse
deleteAccountingInvoiceCreditMemosById = Endpoint
  { method = HTTP.DELETE
  , path = \pathParams -> fold
      [ "/accounting"
      , "/invoice_credit_memos"
      , "/" <> pathParams.id
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
