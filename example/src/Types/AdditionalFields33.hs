{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields33 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields33 = AdditionalFields33
  { autoExchangeRate :: Bool
  , documentNumber :: Text
  , journalType :: Text
  , taxInclusive :: Bool
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields33 where
  parseJSON = withObject "AdditionalFields33" $ \obj -> do
    autoExchangeRate <- obj .: "auto_exchange_rate"
    documentNumber <- obj .: "document_number"
    journalType <- obj .: "journal_type"
    taxInclusive <- obj .: "tax_inclusive"
    pure $ AdditionalFields33{..}

instance ToJSON AdditionalFields33 where
  toJSON AdditionalFields33{..} =
    object [
      "auto_exchange_rate" .= autoExchangeRate,
      "document_number" .= documentNumber,
      "journal_type" .= journalType,
      "tax_inclusive" .= taxInclusive
    ]
