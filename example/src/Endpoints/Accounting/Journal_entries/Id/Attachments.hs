{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Journal_entries.Id.Attachments where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP


data AccountingJournalEntriesByIdAttachmentsPathParams = AccountingJournalEntriesByIdAttachmentsPathParams
  { id :: Text }

postAccountingJournalEntriesByIdAttachments :: Endpoint AccountingJournalEntriesByIdAttachmentsPathParams CreateAttachmentBody PostAttachmentResponse
postAccountingJournalEntriesByIdAttachments = Endpoint
  { method = HTTP.POST
  , path = \pathParams -> fold
      [ "/accounting"
      , "/journal_entries"
      , "/" <> pathParams.id
      , "/attachments"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
