{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bank_deposits.Id.Attachments.Attachmentid.File where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP


data AccountingBankDepositsByIdAttachmentsByAttachmentIdFilePathParams = AccountingBankDepositsByIdAttachmentsByAttachmentIdFilePathParams
  { id :: Text
  , attachmentId :: Text
  }

getAccountingBankDepositsByIdAttachmentsByAttachmentIdFile :: Endpoint AccountingBankDepositsByIdAttachmentsByAttachmentIdFilePathParams () ()
getAccountingBankDepositsByIdAttachmentsByAttachmentIdFile = Endpoint
  { method = HTTP.GET
  , path = \pathParams -> fold
      [ "/accounting"
      , "/bank_deposits"
      , "/" <> pathParams.id
      , "/attachments"
      , "/" <> pathParams.attachmentId
      , "/file"
      ]
  , toRequestBody = const L.empty
  , fromResponseBody = \_ _ -> Right ()
  }
