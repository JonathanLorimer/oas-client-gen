{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AccountResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AccountResponseWithConnection = AccountResponseWithConnection
  { account :: Account
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON AccountResponseWithConnection where
  parseJSON = withObject "AccountResponseWithConnection" $ \obj -> do
    account <- obj .: "account"
    connection <- obj .: "connection"
    pure $ AccountResponseWithConnection{..}

instance ToJSON AccountResponseWithConnection where
  toJSON AccountResponseWithConnection{..} =
    object [
      "account" .= account,
      "connection" .= connection
    ]
