{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankAccount where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Balance1 (Balance1)

data BankAccount = BankAccount
  { balance :: Maybe Balance1
  , id :: Text
  , lastSyncedAt :: Text
  , mask :: Maybe Text
  , name :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , subtype :: Maybe Text
  , type_ :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON BankAccount where
  parseJSON = withObject "BankAccount" $ \obj -> do
    balance <- obj .: "balance"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    mask <- obj .: "mask"
    name <- obj .: "name"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    subtype <- obj .: "subtype"
    type_ <- obj .: "type"
    pure $ BankAccount{..}

instance ToJSON BankAccount where
  toJSON BankAccount{..} =
    object [
      "balance" .= balance,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "mask" .= mask,
      "name" .= name,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "subtype" .= subtype,
      "type" .= type_
    ]
