{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankAccountResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BankAccountResponseWithConnection = BankAccountResponseWithConnection
  { bankAccount :: BankAccount
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON BankAccountResponseWithConnection where
  parseJSON = withObject "BankAccountResponseWithConnection" $ \obj -> do
    bankAccount <- obj .: "bank_account"
    connection <- obj .: "connection"
    pure $ BankAccountResponseWithConnection{..}

instance ToJSON BankAccountResponseWithConnection where
  toJSON BankAccountResponseWithConnection{..} =
    object [
      "bank_account" .= bankAccount,
      "connection" .= connection
    ]
