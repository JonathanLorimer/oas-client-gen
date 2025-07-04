{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields26 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.LinkedJournalEntries3 (LinkedJournalEntries3)

data AdditionalFields26 = AdditionalFields26
  { linkedJournalEntries :: [LinkedJournalEntries3]
  , poNumber :: Maybe Text
  , shippingAmount :: Maybe Double
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields26 where
  parseJSON = withObject "AdditionalFields26" $ \obj -> do
    linkedJournalEntries <- obj .: "linked_journal_entries"
    poNumber <- obj .: "po_number"
    shippingAmount <- obj .: "shipping_amount"
    pure $ AdditionalFields26{..}

instance ToJSON AdditionalFields26 where
  toJSON AdditionalFields26{..} =
    object [
      "linked_journal_entries" .= linkedJournalEntries,
      "po_number" .= poNumber,
      "shipping_amount" .= shippingAmount
    ]
