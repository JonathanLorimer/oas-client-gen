{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListTaxAgencyResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.TaxAgency (TaxAgency)

data ListTaxAgencyResponseWithConnection = ListTaxAgencyResponseWithConnection
  { connection :: Connection
  , nextCursor :: Maybe Text
  , taxAgencies :: [TaxAgency]
  }
  deriving (Show, Eq)

instance FromJSON ListTaxAgencyResponseWithConnection where
  parseJSON = withObject "ListTaxAgencyResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    taxAgencies <- obj .: "tax_agencies"
    pure $ ListTaxAgencyResponseWithConnection{..}

instance ToJSON ListTaxAgencyResponseWithConnection where
  toJSON ListTaxAgencyResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "next_cursor" .= nextCursor,
      "tax_agencies" .= taxAgencies
    ]
