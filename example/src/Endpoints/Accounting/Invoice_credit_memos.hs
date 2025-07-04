{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Invoice_credit_memos where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields22 (AdditionalFields22)
import Types.AdditionalFields23 (AdditionalFields23)
import Types.AsyncResponse24 (AsyncResponse24)
import Types.CreateCreateInvoiceCreditMemoRequest (CreateCreateInvoiceCreditMemoRequest)
import Types.CreateInvoiceCreditMemo (CreateInvoiceCreditMemo)
import Types.CreateInvoiceCreditMemoResponse (CreateInvoiceCreditMemoResponse)
import Types.CreateInvoiceCreditMemoResponse1 (CreateInvoiceCreditMemoResponse1)
import Types.Item7 (Item7)
import Types.LineItems11 (LineItems11)
import Types.CreateInvoiceCreditMemoResponse (CreateInvoiceCreditMemoResponse)

postAccountingInvoiceCreditMemos :: Endpoint () CreateCreateInvoiceCreditMemoRequest CreateInvoiceCreditMemoResponse
postAccountingInvoiceCreditMemos = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/invoice_credit_memos"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
