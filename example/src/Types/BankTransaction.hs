{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankTransaction where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data BankTransaction = BankTransaction
  { accountId :: Maybe Text
  , amount :: Maybe Double
  , category :: [Maybe Text]
  , currencyCode :: Maybe Text
  , date :: Maybe Text
  , id :: Text
  , lastSyncedAt :: Text
  , merchantName :: Maybe Text
  , platformData :: Map Text Value
  , platformId :: Text
  , status :: Text
  }
  deriving (Show, Eq)

instance FromJSON BankTransaction where
  parseJSON = withObject "BankTransaction" $ \obj -> do
    accountId <- obj .: "account_id"
    amount <- obj .: "amount"
    category <- obj .: "category"
    currencyCode <- obj .: "currency_code"
    date <- obj .: "date"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    merchantName <- obj .: "merchant_name"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    status <- obj .: "status"
    pure $ BankTransaction{..}

instance ToJSON BankTransaction where
  toJSON BankTransaction{..} =
    object [
      "account_id" .= accountId,
      "amount" .= amount,
      "category" .= category,
      "currency_code" .= currencyCode,
      "date" .= date,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "merchant_name" .= merchantName,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "status" .= status
    ]
