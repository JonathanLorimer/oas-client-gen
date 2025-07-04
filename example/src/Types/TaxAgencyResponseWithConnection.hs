{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.TaxAgencyResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data TaxAgencyResponseWithConnection = TaxAgencyResponseWithConnection
  { connection :: Connection
  , taxAgency :: TaxAgency
  }
  deriving (Show, Eq)

instance FromJSON TaxAgencyResponseWithConnection where
  parseJSON = withObject "TaxAgencyResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    taxAgency <- obj .: "tax_agency"
    pure $ TaxAgencyResponseWithConnection{..}

instance ToJSON TaxAgencyResponseWithConnection where
  toJSON TaxAgencyResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "tax_agency" .= taxAgency
    ]
