{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Customer where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Orders1 (Orders1)

data Customer = Customer
  { createdAt :: Maybe Text
  , email :: Maybe Text
  , firstName :: Maybe Text
  , id :: Maybe Text
  , lastName :: Maybe Text
  , orders :: [Orders1]
  , phone :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Maybe Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Customer where
  parseJSON = withObject "Customer" $ \obj -> do
    createdAt <- obj .: "created_at"
    email <- obj .: "email"
    firstName <- obj .: "first_name"
    id <- obj .: "id"
    lastName <- obj .: "last_name"
    orders <- obj .: "orders"
    phone <- obj .: "phone"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    updatedAt <- obj .: "updated_at"
    pure $ Customer{..}

instance ToJSON Customer where
  toJSON Customer{..} =
    object [
      "created_at" .= createdAt,
      "email" .= email,
      "first_name" .= firstName,
      "id" .= id,
      "last_name" .= lastName,
      "orders" .= orders,
      "phone" .= phone,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "updated_at" .= updatedAt
    ]
