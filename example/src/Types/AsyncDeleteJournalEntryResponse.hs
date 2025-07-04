{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteJournalEntryResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncDeleteJournalEntryResponse1 (AsyncDeleteJournalEntryResponse1)
import Types.AsyncResponse33 (AsyncResponse33)

data AsyncDeleteJournalEntryResponse
  = AsyncDeleteJournalEntryResponseVariant1 AsyncDeleteJournalEntryResponse
  | AsyncDeleteJournalEntryResponseVariant2 AsyncDeleteJournalEntryResponse1
  deriving (Show, Eq)

instance FromJSON AsyncDeleteJournalEntryResponse where
  parseJSON value = asum
    [ AsyncDeleteJournalEntryResponseVariant1 <$> parseJSON value
    , AsyncDeleteJournalEntryResponseVariant2 <$> parseJSON value
    ]

instance ToJSON AsyncDeleteJournalEntryResponse where
  toJSON = \case
    AsyncDeleteJournalEntryResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    AsyncDeleteJournalEntryResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
