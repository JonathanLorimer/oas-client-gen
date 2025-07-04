{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bank_deposits.Attachments.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.Attachment (Attachment)
import Types.AttachmentResponse (AttachmentResponse)

data AccountingBankDepositsAttachmentsByIdPathParams = AccountingBankDepositsAttachmentsByIdPathParams
  { id :: Text }

getAccountingBankDepositsAttachmentsById :: Endpoint AccountingBankDepositsAttachmentsByIdPathParams () AttachmentResponse
getAccountingBankDepositsAttachmentsById = Endpoint
  { method = HTTP.GET
  , path = \pathParams -> fold
      [ "/accounting"
      , "/bank_deposits"
      , "/attachments"
      , "/" <> pathParams.id
      ]
  , toRequestBody = const L.empty
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
