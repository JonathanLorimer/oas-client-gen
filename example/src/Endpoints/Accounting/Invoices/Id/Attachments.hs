{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Invoices.Id.Attachments where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP


data AccountingInvoicesByIdAttachmentsPathParams = AccountingInvoicesByIdAttachmentsPathParams
  { id :: Text }

postAccountingInvoicesByIdAttachments :: Endpoint AccountingInvoicesByIdAttachmentsPathParams CreateAttachmentBody PostAttachmentResponse
postAccountingInvoicesByIdAttachments = Endpoint
  { method = HTTP.POST
  , path = \pathParams -> fold
      [ "/accounting"
      , "/invoices"
      , "/" <> pathParams.id
      , "/attachments"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
