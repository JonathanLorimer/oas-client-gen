{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdsAccountResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdsAccountResponseWithConnection = AdsAccountResponseWithConnection
  { account :: AdsAccount
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON AdsAccountResponseWithConnection where
  parseJSON = withObject "AdsAccountResponseWithConnection" $ \obj -> do
    account <- obj .: "account"
    connection <- obj .: "connection"
    pure $ AdsAccountResponseWithConnection{..}

instance ToJSON AdsAccountResponseWithConnection where
  toJSON AdsAccountResponseWithConnection{..} =
    object [
      "account" .= account,
      "connection" .= connection
    ]
