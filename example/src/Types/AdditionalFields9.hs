{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields9 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.LinkedJournalEntries1 (LinkedJournalEntries1)

data AdditionalFields9 = AdditionalFields9
  { linkedJournalEntries :: [LinkedJournalEntries1]
  , reference :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields9 where
  parseJSON = withObject "AdditionalFields9" $ \obj -> do
    linkedJournalEntries <- obj .: "linked_journal_entries"
    reference <- obj .: "reference"
    pure $ AdditionalFields9{..}

instance ToJSON AdditionalFields9 where
  toJSON AdditionalFields9{..} =
    object [
      "linked_journal_entries" .= linkedJournalEntries,
      "reference" .= reference
    ]
