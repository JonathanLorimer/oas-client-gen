{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListBankDepositResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.BankDeposit (BankDeposit)
import Types.LineItems (LineItems)
import Types.LinkedPayments (LinkedPayments)

data ListBankDepositResponseWithConnection = ListBankDepositResponseWithConnection
  { bankDeposits :: [BankDeposit]
  , connection :: Connection
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListBankDepositResponseWithConnection where
  parseJSON = withObject "ListBankDepositResponseWithConnection" $ \obj -> do
    bankDeposits <- obj .: "bank_deposits"
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    pure $ ListBankDepositResponseWithConnection{..}

instance ToJSON ListBankDepositResponseWithConnection where
  toJSON ListBankDepositResponseWithConnection{..} =
    object [
      "bank_deposits" .= bankDeposits,
      "connection" .= connection,
      "next_cursor" .= nextCursor
    ]
