{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankAccountBalance where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data BankAccountBalance = BankAccountBalance
  { accountId :: Maybe Text
  , available :: Maybe Double
  , currencyCode :: Maybe Text
  , current :: Maybe Double
  , id :: Text
  , lastSyncedAt :: Text
  , platformData :: Map Text Value
  , platformId :: Text
  }
  deriving (Show, Eq)

instance FromJSON BankAccountBalance where
  parseJSON = withObject "BankAccountBalance" $ \obj -> do
    accountId <- obj .: "account_id"
    available <- obj .: "available"
    currencyCode <- obj .: "currency_code"
    current <- obj .: "current"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    pure $ BankAccountBalance{..}

instance ToJSON BankAccountBalance where
  toJSON BankAccountBalance{..} =
    object [
      "account_id" .= accountId,
      "available" .= available,
      "currency_code" .= currencyCode,
      "current" .= current,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "platform_data" .= platformData,
      "platform_id" .= platformId
    ]
