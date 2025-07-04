{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Subscription where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.SubscriptionItem (SubscriptionItem)

data Subscription = Subscription
  { createdAt :: Text
  , id :: Text
  , isoCurrencyCode :: Text
  , items :: [SubscriptionItem]
  , platformCustomerId :: Maybe Text
  , platformId :: Text
  , status :: Text
  , updatedAt :: Text
  }
  deriving (Show, Eq)

instance FromJSON Subscription where
  parseJSON = withObject "Subscription" $ \obj -> do
    createdAt <- obj .: "created_at"
    id <- obj .: "id"
    isoCurrencyCode <- obj .: "iso_currency_code"
    items <- obj .: "items"
    platformCustomerId <- obj .: "platform_customer_id"
    platformId <- obj .: "platform_id"
    status <- obj .: "status"
    updatedAt <- obj .: "updated_at"
    pure $ Subscription{..}

instance ToJSON Subscription where
  toJSON Subscription{..} =
    object [
      "created_at" .= createdAt,
      "id" .= id,
      "iso_currency_code" .= isoCurrencyCode,
      "items" .= items,
      "platform_customer_id" .= platformCustomerId,
      "platform_id" .= platformId,
      "status" .= status,
      "updated_at" .= updatedAt
    ]
