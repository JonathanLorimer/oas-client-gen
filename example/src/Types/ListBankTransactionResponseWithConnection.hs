{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListBankTransactionResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.BankTransaction (BankTransaction)

data ListBankTransactionResponseWithConnection = ListBankTransactionResponseWithConnection
  { bankTransactions :: [BankTransaction]
  , connection :: Connection
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListBankTransactionResponseWithConnection where
  parseJSON = withObject "ListBankTransactionResponseWithConnection" $ \obj -> do
    bankTransactions <- obj .: "bank_transactions"
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    pure $ ListBankTransactionResponseWithConnection{..}

instance ToJSON ListBankTransactionResponseWithConnection where
  toJSON ListBankTransactionResponseWithConnection{..} =
    object [
      "bank_transactions" .= bankTransactions,
      "connection" .= connection,
      "next_cursor" .= nextCursor
    ]
