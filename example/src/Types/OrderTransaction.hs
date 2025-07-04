{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OrderTransaction where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data OrderTransaction = OrderTransaction
  { amount :: Maybe Double
  , createdAt :: Text
  , description :: Maybe Text
  , fee :: Double
  , gateway :: Maybe Text
  , gatewayData :: Map Text Value
  , id :: Text
  , isoCurrencyCode :: Maybe Text
  , orderId :: Maybe Text
  , paymentMethodType :: Text
  , platformCustomerId :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Maybe Text
  , platformType :: Text
  , status :: Text
  , type_ :: Text
  , updatedAt :: Text
  }
  deriving (Show, Eq)

instance FromJSON OrderTransaction where
  parseJSON = withObject "OrderTransaction" $ \obj -> do
    amount <- obj .: "amount"
    createdAt <- obj .: "created_at"
    description <- obj .: "description"
    fee <- obj .: "fee"
    gateway <- obj .: "gateway"
    gatewayData <- obj .: "gateway_data"
    id <- obj .: "id"
    isoCurrencyCode <- obj .: "iso_currency_code"
    orderId <- obj .: "order_id"
    paymentMethodType <- obj .: "payment_method_type"
    platformCustomerId <- obj .: "platform_customer_id"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    platformType <- obj .: "platform_type"
    status <- obj .: "status"
    type_ <- obj .: "type"
    updatedAt <- obj .: "updated_at"
    pure $ OrderTransaction{..}

instance ToJSON OrderTransaction where
  toJSON OrderTransaction{..} =
    object [
      "amount" .= amount,
      "created_at" .= createdAt,
      "description" .= description,
      "fee" .= fee,
      "gateway" .= gateway,
      "gateway_data" .= gatewayData,
      "id" .= id,
      "iso_currency_code" .= isoCurrencyCode,
      "order_id" .= orderId,
      "payment_method_type" .= paymentMethodType,
      "platform_customer_id" .= platformCustomerId,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "platform_type" .= platformType,
      "status" .= status,
      "type" .= type_,
      "updated_at" .= updatedAt
    ]
