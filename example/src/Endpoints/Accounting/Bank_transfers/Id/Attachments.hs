{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bank_transfers.Id.Attachments where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP


data AccountingBankTransfersByIdAttachmentsPathParams = AccountingBankTransfersByIdAttachmentsPathParams
  { id :: Text }

postAccountingBankTransfersByIdAttachments :: Endpoint AccountingBankTransfersByIdAttachmentsPathParams CreateAttachmentBody PostAttachmentResponse
postAccountingBankTransfersByIdAttachments = Endpoint
  { method = HTTP.POST
  , path = \pathParams -> fold
      [ "/accounting"
      , "/bank_transfers"
      , "/" <> pathParams.id
      , "/attachments"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
