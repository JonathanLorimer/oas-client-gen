{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Expenses.Id.Attachments where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP


data AccountingExpensesByIdAttachmentsPathParams = AccountingExpensesByIdAttachmentsPathParams
  { id :: Text }

postAccountingExpensesByIdAttachments :: Endpoint AccountingExpensesByIdAttachmentsPathParams CreateAttachmentBody PostAttachmentResponse
postAccountingExpensesByIdAttachments = Endpoint
  { method = HTTP.POST
  , path = \pathParams -> fold
      [ "/accounting"
      , "/expenses"
      , "/" <> pathParams.id
      , "/attachments"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
