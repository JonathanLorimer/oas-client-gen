{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.InvoiceResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data InvoiceResponseWithConnection = InvoiceResponseWithConnection
  { connection :: Connection
  , invoice :: Invoice
  }
  deriving (Show, Eq)

instance FromJSON InvoiceResponseWithConnection where
  parseJSON = withObject "InvoiceResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    invoice <- obj .: "invoice"
    pure $ InvoiceResponseWithConnection{..}

instance ToJSON InvoiceResponseWithConnection where
  toJSON InvoiceResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "invoice" .= invoice
    ]
