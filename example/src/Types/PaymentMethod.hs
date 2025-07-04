{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PaymentMethod where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data PaymentMethod = PaymentMethod
  { createdAt :: Maybe Text
  , id :: Text
  , lastSyncedAt :: Text
  , name :: Text
  , platformData :: Map Text Value
  , platformId :: Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON PaymentMethod where
  parseJSON = withObject "PaymentMethod" $ \obj -> do
    createdAt <- obj .: "created_at"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    name <- obj .: "name"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    updatedAt <- obj .: "updated_at"
    pure $ PaymentMethod{..}

instance ToJSON PaymentMethod where
  toJSON PaymentMethod{..} =
    object [
      "created_at" .= createdAt,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "name" .= name,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "updated_at" .= updatedAt
    ]
