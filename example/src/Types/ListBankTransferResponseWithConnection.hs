{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListBankTransferResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.BankTransfer (BankTransfer)

data ListBankTransferResponseWithConnection = ListBankTransferResponseWithConnection
  { bankTransfers :: [BankTransfer]
  , connection :: Connection
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListBankTransferResponseWithConnection where
  parseJSON = withObject "ListBankTransferResponseWithConnection" $ \obj -> do
    bankTransfers <- obj .: "bank_transfers"
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    pure $ ListBankTransferResponseWithConnection{..}

instance ToJSON ListBankTransferResponseWithConnection where
  toJSON ListBankTransferResponseWithConnection{..} =
    object [
      "bank_transfers" .= bankTransfers,
      "connection" .= connection,
      "next_cursor" .= nextCursor
    ]
