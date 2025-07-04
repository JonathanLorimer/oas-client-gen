{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedJournalEntries2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedJournalEntries2 = LinkedJournalEntries2
  { allocatedAt :: Text
  , amount :: Text
  , journalId :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedJournalEntries2 where
  parseJSON = withObject "LinkedJournalEntries2" $ \obj -> do
    allocatedAt <- obj .: "allocated_at"
    amount <- obj .: "amount"
    journalId <- obj .: "journal_id"
    pure $ LinkedJournalEntries2{..}

instance ToJSON LinkedJournalEntries2 where
  toJSON LinkedJournalEntries2{..} =
    object [
      "allocated_at" .= allocatedAt,
      "amount" .= amount,
      "journal_id" .= journalId
    ]
