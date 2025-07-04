{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateJournalEntryRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields33 (AdditionalFields33)
import Types.AdditionalFields34 (AdditionalFields34)
import Types.CreateJournalEntry (CreateJournalEntry)
import Types.LineItems15 (LineItems15)

data CreateCreateJournalEntryRequest = CreateCreateJournalEntryRequest
  { journalEntry :: CreateJournalEntry
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateJournalEntryRequest where
  parseJSON = withObject "CreateCreateJournalEntryRequest" $ \obj -> do
    journalEntry <- obj .: "journal_entry"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateJournalEntryRequest{..}

instance ToJSON CreateCreateJournalEntryRequest where
  toJSON CreateCreateJournalEntryRequest{..} =
    object [
      "journal_entry" .= journalEntry,
      "response_mode" .= responseMode
    ]
