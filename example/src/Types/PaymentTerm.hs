{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PaymentTerm where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data PaymentTerm = PaymentTerm
  { createdAt :: Maybe Text
  , discountDays :: Maybe Double
  , discountPercent :: Maybe Double
  , dueDays :: Double
  , id :: Text
  , lastSyncedAt :: Text
  , platformData :: Map Text Value
  , platformId :: Text
  , termName :: Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON PaymentTerm where
  parseJSON = withObject "PaymentTerm" $ \obj -> do
    createdAt <- obj .: "created_at"
    discountDays <- obj .: "discount_days"
    discountPercent <- obj .: "discount_percent"
    dueDays <- obj .: "due_days"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    termName <- obj .: "term_name"
    updatedAt <- obj .: "updated_at"
    pure $ PaymentTerm{..}

instance ToJSON PaymentTerm where
  toJSON PaymentTerm{..} =
    object [
      "created_at" .= createdAt,
      "discount_days" .= discountDays,
      "discount_percent" .= discountPercent,
      "due_days" .= dueDays,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "term_name" .= termName,
      "updated_at" .= updatedAt
    ]
