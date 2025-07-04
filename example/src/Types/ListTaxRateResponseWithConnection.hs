{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListTaxRateResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields38 (AdditionalFields38)
import Types.Components (Components)
import Types.Subsidiaries3 (Subsidiaries3)
import Types.TaxRate (TaxRate)

data ListTaxRateResponseWithConnection = ListTaxRateResponseWithConnection
  { connection :: Connection
  , nextCursor :: Maybe Text
  , taxRates :: [TaxRate]
  }
  deriving (Show, Eq)

instance FromJSON ListTaxRateResponseWithConnection where
  parseJSON = withObject "ListTaxRateResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    taxRates <- obj .: "tax_rates"
    pure $ ListTaxRateResponseWithConnection{..}

instance ToJSON ListTaxRateResponseWithConnection where
  toJSON ListTaxRateResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "next_cursor" .= nextCursor,
      "tax_rates" .= taxRates
    ]
