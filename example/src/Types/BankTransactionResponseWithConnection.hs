{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankTransactionResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BankTransactionResponseWithConnection = BankTransactionResponseWithConnection
  { bankTransaction :: BankTransaction
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON BankTransactionResponseWithConnection where
  parseJSON = withObject "BankTransactionResponseWithConnection" $ \obj -> do
    bankTransaction <- obj .: "bank_transaction"
    connection <- obj .: "connection"
    pure $ BankTransactionResponseWithConnection{..}

instance ToJSON BankTransactionResponseWithConnection where
  toJSON BankTransactionResponseWithConnection{..} =
    object [
      "bank_transaction" .= bankTransaction,
      "connection" .= connection
    ]
