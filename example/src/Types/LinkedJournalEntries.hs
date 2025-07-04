{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedJournalEntries where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedJournalEntries = LinkedJournalEntries
  { allocatedAt :: Text
  , amount :: Text
  , journalId :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedJournalEntries where
  parseJSON = withObject "LinkedJournalEntries" $ \obj -> do
    allocatedAt <- obj .: "allocated_at"
    amount <- obj .: "amount"
    journalId <- obj .: "journal_id"
    pure $ LinkedJournalEntries{..}

instance ToJSON LinkedJournalEntries where
  toJSON LinkedJournalEntries{..} =
    object [
      "allocated_at" .= allocatedAt,
      "amount" .= amount,
      "journal_id" .= journalId
    ]
