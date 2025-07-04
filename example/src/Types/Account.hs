{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Account where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Subsidiaries (Subsidiaries)

data Account = Account
  { accountType :: Text
  , balance :: Maybe Double
  , category :: Text
  , createdAt :: Maybe Text
  , currencyCode :: Maybe Text
  , id :: Text
  , lastSyncedAt :: Text
  , name :: Maybe Text
  , nominalCode :: Maybe Text
  , parentId :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , platformUrl :: Maybe Text
  , status :: Text
  , subsidiaries :: [Subsidiaries]
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Account where
  parseJSON = withObject "Account" $ \obj -> do
    accountType <- obj .: "account_type"
    balance <- obj .: "balance"
    category <- obj .: "category"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    name <- obj .: "name"
    nominalCode <- obj .: "nominal_code"
    parentId <- obj .: "parent_id"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformUrl <- obj .: "platform_url"
    status <- obj .: "status"
    subsidiaries <- obj .: "subsidiaries"
    updatedAt <- obj .: "updated_at"
    pure $ Account{..}

instance ToJSON Account where
  toJSON Account{..} =
    object [
      "account_type" .= accountType,
      "balance" .= balance,
      "category" .= category,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "name" .= name,
      "nominal_code" .= nominalCode,
      "parent_id" .= parentId,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_url" .= platformUrl,
      "status" .= status,
      "subsidiaries" .= subsidiaries,
      "updated_at" .= updatedAt
    ]
