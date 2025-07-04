{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListAccountResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Account (Account)
import Types.Connection (Connection)
import Types.Subsidiaries (Subsidiaries)

data ListAccountResponseWithConnection = ListAccountResponseWithConnection
  { accounts :: [Account]
  , connection :: Connection
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListAccountResponseWithConnection where
  parseJSON = withObject "ListAccountResponseWithConnection" $ \obj -> do
    accounts <- obj .: "accounts"
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    pure $ ListAccountResponseWithConnection{..}

instance ToJSON ListAccountResponseWithConnection where
  toJSON ListAccountResponseWithConnection{..} =
    object [
      "accounts" .= accounts,
      "connection" .= connection,
      "next_cursor" .= nextCursor
    ]
