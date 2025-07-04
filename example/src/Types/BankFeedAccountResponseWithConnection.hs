{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankFeedAccountResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BankFeedAccountResponseWithConnection = BankFeedAccountResponseWithConnection
  { bankFeedAccount :: BankFeedAccount
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON BankFeedAccountResponseWithConnection where
  parseJSON = withObject "BankFeedAccountResponseWithConnection" $ \obj -> do
    bankFeedAccount <- obj .: "bank_feed_account"
    connection <- obj .: "connection"
    pure $ BankFeedAccountResponseWithConnection{..}

instance ToJSON BankFeedAccountResponseWithConnection where
  toJSON BankFeedAccountResponseWithConnection{..} =
    object [
      "bank_feed_account" .= bankFeedAccount,
      "connection" .= connection
    ]
