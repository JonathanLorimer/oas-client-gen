{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankTransferResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BankTransferResponseWithConnection = BankTransferResponseWithConnection
  { bankTransfer :: BankTransfer
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON BankTransferResponseWithConnection where
  parseJSON = withObject "BankTransferResponseWithConnection" $ \obj -> do
    bankTransfer <- obj .: "bank_transfer"
    connection <- obj .: "connection"
    pure $ BankTransferResponseWithConnection{..}

instance ToJSON BankTransferResponseWithConnection where
  toJSON BankTransferResponseWithConnection{..} =
    object [
      "bank_transfer" .= bankTransfer,
      "connection" .= connection
    ]
