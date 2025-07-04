{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.JournalEntryResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data JournalEntryResponseWithConnection = JournalEntryResponseWithConnection
  { connection :: Connection
  , journalEntry :: JournalEntry
  }
  deriving (Show, Eq)

instance FromJSON JournalEntryResponseWithConnection where
  parseJSON = withObject "JournalEntryResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    journalEntry <- obj .: "journal_entry"
    pure $ JournalEntryResponseWithConnection{..}

instance ToJSON JournalEntryResponseWithConnection where
  toJSON JournalEntryResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "journal_entry" .= journalEntry
    ]
