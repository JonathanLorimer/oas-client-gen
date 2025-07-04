{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedJournalEntries1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedJournalEntries1 = LinkedJournalEntries1
  { allocatedAt :: Text
  , amount :: Text
  , journalId :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedJournalEntries1 where
  parseJSON = withObject "LinkedJournalEntries1" $ \obj -> do
    allocatedAt <- obj .: "allocated_at"
    amount <- obj .: "amount"
    journalId <- obj .: "journal_id"
    pure $ LinkedJournalEntries1{..}

instance ToJSON LinkedJournalEntries1 where
  toJSON LinkedJournalEntries1{..} =
    object [
      "allocated_at" .= allocatedAt,
      "amount" .= amount,
      "journal_id" .= journalId
    ]
