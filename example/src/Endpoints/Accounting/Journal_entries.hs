{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Journal_entries where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields33 (AdditionalFields33)
import Types.AdditionalFields34 (AdditionalFields34)
import Types.AsyncResponse32 (AsyncResponse32)
import Types.CreateCreateJournalEntryRequest (CreateCreateJournalEntryRequest)
import Types.CreateJournalEntry (CreateJournalEntry)
import Types.CreateJournalEntryResponse (CreateJournalEntryResponse)
import Types.CreateJournalEntryResponse1 (CreateJournalEntryResponse1)
import Types.LineItems15 (LineItems15)
import Types.CreateJournalEntryResponse (CreateJournalEntryResponse)

postAccountingJournalEntries :: Endpoint () CreateCreateJournalEntryRequest CreateJournalEntryResponse
postAccountingJournalEntries = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/journal_entries"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
