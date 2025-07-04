{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateJournalEntryResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse32 (AsyncResponse32)
import Types.CreateJournalEntryResponse1 (CreateJournalEntryResponse1)

data CreateJournalEntryResponse
  = CreateJournalEntryResponseVariant1 CreateJournalEntryResponse
  | CreateJournalEntryResponseVariant2 CreateJournalEntryResponse1
  deriving (Show, Eq)

instance FromJSON CreateJournalEntryResponse where
  parseJSON value = asum
    [ CreateJournalEntryResponseVariant1 <$> parseJSON value
    , CreateJournalEntryResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateJournalEntryResponse where
  toJSON = \case
    CreateJournalEntryResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateJournalEntryResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
