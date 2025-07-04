{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankDepositResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BankDepositResponseWithConnection = BankDepositResponseWithConnection
  { bankDeposit :: BankDeposit
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON BankDepositResponseWithConnection where
  parseJSON = withObject "BankDepositResponseWithConnection" $ \obj -> do
    bankDeposit <- obj .: "bank_deposit"
    connection <- obj .: "connection"
    pure $ BankDepositResponseWithConnection{..}

instance ToJSON BankDepositResponseWithConnection where
  toJSON BankDepositResponseWithConnection{..} =
    object [
      "bank_deposit" .= bankDeposit,
      "connection" .= connection
    ]
