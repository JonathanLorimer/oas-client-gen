{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Subsidiary where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data Subsidiary = Subsidiary
  { country :: Text
  , createdAt :: Maybe Text
  , currencyCode :: Maybe Text
  , elimination :: Bool
  , id :: Text
  , lastSyncedAt :: Text
  , name :: Maybe Text
  , parentId :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , status :: Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Subsidiary where
  parseJSON = withObject "Subsidiary" $ \obj -> do
    country <- obj .: "country"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    elimination <- obj .: "elimination"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    name <- obj .: "name"
    parentId <- obj .: "parent_id"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    status <- obj .: "status"
    updatedAt <- obj .: "updated_at"
    pure $ Subsidiary{..}

instance ToJSON Subsidiary where
  toJSON Subsidiary{..} =
    object [
      "country" .= country,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "elimination" .= elimination,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "name" .= name,
      "parent_id" .= parentId,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "status" .= status,
      "updated_at" .= updatedAt
    ]
