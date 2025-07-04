{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateJournalEntry where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields33 (AdditionalFields33)
import Types.AdditionalFields34 (AdditionalFields34)
import Types.LineItems15 (LineItems15)

data CreateJournalEntry = CreateJournalEntry
  { additionalFields :: AdditionalFields33
  , currencyCode :: Text
  , currencyRate :: Double
  , lineItems :: [LineItems15]
  , memo :: Text
  , status :: Text
  , subsidiaryId :: Text
  , transactionDate :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateJournalEntry where
  parseJSON = withObject "CreateJournalEntry" $ \obj -> do
    additionalFields <- obj .: "additional_fields"
    currencyCode <- obj .: "currency_code"
    currencyRate <- obj .: "currency_rate"
    lineItems <- obj .: "line_items"
    memo <- obj .: "memo"
    status <- obj .: "status"
    subsidiaryId <- obj .: "subsidiary_id"
    transactionDate <- obj .: "transaction_date"
    pure $ CreateJournalEntry{..}

instance ToJSON CreateJournalEntry where
  toJSON CreateJournalEntry{..} =
    object [
      "additional_fields" .= additionalFields,
      "currency_code" .= currencyCode,
      "currency_rate" .= currencyRate,
      "line_items" .= lineItems,
      "memo" .= memo,
      "status" .= status,
      "subsidiary_id" .= subsidiaryId,
      "transaction_date" .= transactionDate
    ]
