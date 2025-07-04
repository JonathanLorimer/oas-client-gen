{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedJournalEntries3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedJournalEntries3 = LinkedJournalEntries3
  { allocatedAt :: Text
  , amount :: Text
  , journalId :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedJournalEntries3 where
  parseJSON = withObject "LinkedJournalEntries3" $ \obj -> do
    allocatedAt <- obj .: "allocated_at"
    amount <- obj .: "amount"
    journalId <- obj .: "journal_id"
    pure $ LinkedJournalEntries3{..}

instance ToJSON LinkedJournalEntries3 where
  toJSON LinkedJournalEntries3{..} =
    object [
      "allocated_at" .= allocatedAt,
      "amount" .= amount,
      "journal_id" .= journalId
    ]
