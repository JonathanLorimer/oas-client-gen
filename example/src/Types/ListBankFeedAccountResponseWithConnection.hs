{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListBankFeedAccountResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.BankFeedAccount (BankFeedAccount)

data ListBankFeedAccountResponseWithConnection = ListBankFeedAccountResponseWithConnection
  { bankFeedAccounts :: [BankFeedAccount]
  , connection :: Connection
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListBankFeedAccountResponseWithConnection where
  parseJSON = withObject "ListBankFeedAccountResponseWithConnection" $ \obj -> do
    bankFeedAccounts <- obj .: "bank_feed_accounts"
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    pure $ ListBankFeedAccountResponseWithConnection{..}

instance ToJSON ListBankFeedAccountResponseWithConnection where
  toJSON ListBankFeedAccountResponseWithConnection{..} =
    object [
      "bank_feed_accounts" .= bankFeedAccounts,
      "connection" .= connection,
      "next_cursor" .= nextCursor
    ]
