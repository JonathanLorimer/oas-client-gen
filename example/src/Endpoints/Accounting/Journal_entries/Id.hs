{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Journal_entries.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AsyncDeleteJournalEntryResponse (AsyncDeleteJournalEntryResponse)
import Types.AsyncDeleteJournalEntryResponse1 (AsyncDeleteJournalEntryResponse1)
import Types.AsyncResponse33 (AsyncResponse33)
import Types.AsyncDeleteJournalEntryResponse (AsyncDeleteJournalEntryResponse)

data AccountingJournalEntriesByIdPathParams = AccountingJournalEntriesByIdPathParams
  { id :: Text }

deleteAccountingJournalEntriesById :: Endpoint AccountingJournalEntriesByIdPathParams AsyncWriteParams AsyncDeleteJournalEntryResponse
deleteAccountingJournalEntriesById = Endpoint
  { method = HTTP.DELETE
  , path = \pathParams -> fold
      [ "/accounting"
      , "/journal_entries"
      , "/" <> pathParams.id
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
