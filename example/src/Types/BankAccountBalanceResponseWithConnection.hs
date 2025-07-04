{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankAccountBalanceResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.BankAccountBalance (BankAccountBalance)

data BankAccountBalanceResponseWithConnection = BankAccountBalanceResponseWithConnection
  { bankAccountBalance :: BankAccountBalance
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON BankAccountBalanceResponseWithConnection where
  parseJSON = withObject "BankAccountBalanceResponseWithConnection" $ \obj -> do
    bankAccountBalance <- obj .: "bank_account_balance"
    connection <- obj .: "connection"
    pure $ BankAccountBalanceResponseWithConnection{..}

instance ToJSON BankAccountBalanceResponseWithConnection where
  toJSON BankAccountBalanceResponseWithConnection{..} =
    object [
      "bank_account_balance" .= bankAccountBalance,
      "connection" .= connection
    ]
