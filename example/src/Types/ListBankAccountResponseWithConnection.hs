{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListBankAccountResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Balance1 (Balance1)
import Types.BankAccount (BankAccount)

data ListBankAccountResponseWithConnection = ListBankAccountResponseWithConnection
  { bankAccounts :: [BankAccount]
  , connection :: Connection
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListBankAccountResponseWithConnection where
  parseJSON = withObject "ListBankAccountResponseWithConnection" $ \obj -> do
    bankAccounts <- obj .: "bank_accounts"
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    pure $ ListBankAccountResponseWithConnection{..}

instance ToJSON ListBankAccountResponseWithConnection where
  toJSON ListBankAccountResponseWithConnection{..} =
    object [
      "bank_accounts" .= bankAccounts,
      "connection" .= connection,
      "next_cursor" .= nextCursor
    ]
