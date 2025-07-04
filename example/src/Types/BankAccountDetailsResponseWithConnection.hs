{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankAccountDetailsResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Ach (Ach)
import Types.BankAccountDetails (BankAccountDetails)

data BankAccountDetailsResponseWithConnection = BankAccountDetailsResponseWithConnection
  { bankAccountDetails :: BankAccountDetails
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON BankAccountDetailsResponseWithConnection where
  parseJSON = withObject "BankAccountDetailsResponseWithConnection" $ \obj -> do
    bankAccountDetails <- obj .: "bank_account_details"
    connection <- obj .: "connection"
    pure $ BankAccountDetailsResponseWithConnection{..}

instance ToJSON BankAccountDetailsResponseWithConnection where
  toJSON BankAccountDetailsResponseWithConnection{..} =
    object [
      "bank_account_details" .= bankAccountDetails,
      "connection" .= connection
    ]
