{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.LinkedJournalEntries (LinkedJournalEntries)

data AdditionalFields7 = AdditionalFields7
  { linkedJournalEntries :: [LinkedJournalEntries]
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields7 where
  parseJSON = withObject "AdditionalFields7" $ \obj -> do
    linkedJournalEntries <- obj .: "linked_journal_entries"
    pure $ AdditionalFields7{..}

instance ToJSON AdditionalFields7 where
  toJSON AdditionalFields7{..} =
    object [
      "linked_journal_entries" .= linkedJournalEntries
    ]
