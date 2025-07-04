{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankAccountDetails where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Ach (Ach)

data BankAccountDetails = BankAccountDetails
  { ach :: Maybe Ach
  , id :: Text
  , lastSyncedAt :: Text
  , platformData :: Map Text Value
  , platformId :: Text
  }
  deriving (Show, Eq)

instance FromJSON BankAccountDetails where
  parseJSON = withObject "BankAccountDetails" $ \obj -> do
    ach <- obj .: "ach"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    pure $ BankAccountDetails{..}

instance ToJSON BankAccountDetails where
  toJSON BankAccountDetails{..} =
    object [
      "ach" .= ach,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "platform_data" .= platformData,
      "platform_id" .= platformId
    ]
