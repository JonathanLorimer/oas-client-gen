{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields24 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.LinkedJournalEntries2 (LinkedJournalEntries2)

data AdditionalFields24 = AdditionalFields24
  { linkedJournalEntries :: [LinkedJournalEntries2]
  , paymentMethod :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields24 where
  parseJSON = withObject "AdditionalFields24" $ \obj -> do
    linkedJournalEntries <- obj .: "linked_journal_entries"
    paymentMethod <- obj .: "payment_method"
    pure $ AdditionalFields24{..}

instance ToJSON AdditionalFields24 where
  toJSON AdditionalFields24{..} =
    object [
      "linked_journal_entries" .= linkedJournalEntries,
      "payment_method" .= paymentMethod
    ]
