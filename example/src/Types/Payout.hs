{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Payout where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Destination (Destination)
import Types.OrderTransaction (OrderTransaction)

data Payout = Payout
  { amount :: Double
  , arrivalAt :: Text
  , createdAt :: Text
  , destination :: Maybe Destination
  , gateway :: Text
  , gatewayAccountId :: Text
  , id :: Text
  , isoCurrencyCode :: Text
  , method :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Maybe Text
  , schedule :: Text
  , status :: Text
  , transactions :: [OrderTransaction]
  , type_ :: Text
  , updatedAt :: Text
  }
  deriving (Show, Eq)

instance FromJSON Payout where
  parseJSON = withObject "Payout" $ \obj -> do
    amount <- obj .: "amount"
    arrivalAt <- obj .: "arrival_at"
    createdAt <- obj .: "created_at"
    destination <- obj .: "destination"
    gateway <- obj .: "gateway"
    gatewayAccountId <- obj .: "gateway_account_id"
    id <- obj .: "id"
    isoCurrencyCode <- obj .: "iso_currency_code"
    method <- obj .: "method"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    schedule <- obj .: "schedule"
    status <- obj .: "status"
    transactions <- obj .: "transactions"
    type_ <- obj .: "type"
    updatedAt <- obj .: "updated_at"
    pure $ Payout{..}

instance ToJSON Payout where
  toJSON Payout{..} =
    object [
      "amount" .= amount,
      "arrival_at" .= arrivalAt,
      "created_at" .= createdAt,
      "destination" .= destination,
      "gateway" .= gateway,
      "gateway_account_id" .= gatewayAccountId,
      "id" .= id,
      "iso_currency_code" .= isoCurrencyCode,
      "method" .= method,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "schedule" .= schedule,
      "status" .= status,
      "transactions" .= transactions,
      "type" .= type_,
      "updated_at" .= updatedAt
    ]
