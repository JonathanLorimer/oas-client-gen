{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListJournalEntryResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields31 (AdditionalFields31)
import Types.AdditionalFields32 (AdditionalFields32)
import Types.JournalEntry (JournalEntry)
import Types.LineItems14 (LineItems14)

data ListJournalEntryResponseWithConnection = ListJournalEntryResponseWithConnection
  { connection :: Connection
  , journalEntries :: [JournalEntry]
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListJournalEntryResponseWithConnection where
  parseJSON = withObject "ListJournalEntryResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    journalEntries <- obj .: "journal_entries"
    nextCursor <- obj .: "next_cursor"
    pure $ ListJournalEntryResponseWithConnection{..}

instance ToJSON ListJournalEntryResponseWithConnection where
  toJSON ListJournalEntryResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "journal_entries" .= journalEntries,
      "next_cursor" .= nextCursor
    ]
