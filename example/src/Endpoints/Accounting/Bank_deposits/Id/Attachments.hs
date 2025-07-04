{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bank_deposits.Id.Attachments where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.CreateAttachmentBody (CreateAttachmentBody)
import Types.PostAttachmentResponse (PostAttachmentResponse)

data AccountingBankDepositsByIdAttachmentsPathParams = AccountingBankDepositsByIdAttachmentsPathParams
  { id :: Text }

postAccountingBankDepositsByIdAttachments :: Endpoint AccountingBankDepositsByIdAttachmentsPathParams CreateAttachmentBody PostAttachmentResponse
postAccountingBankDepositsByIdAttachments = Endpoint
  { method = HTTP.POST
  , path = \pathParams -> fold
      [ "/accounting"
      , "/bank_deposits"
      , "/" <> pathParams.id
      , "/attachments"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
