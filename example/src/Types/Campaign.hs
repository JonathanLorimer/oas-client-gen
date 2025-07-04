{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Campaign where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data Campaign = Campaign
  { accountId :: Maybe Text
  , createdAt :: Maybe Text
  , currencyCode :: Maybe Text
  , endDate :: Maybe Text
  , id :: Text
  , lastSyncedAt :: Text
  , name :: Maybe Text
  , objective :: Text
  , platformData :: Map Text Value
  , platformId :: Text
  , startDate :: Text
  , status :: Text
  , totalBudget :: Maybe Double
  , totalClicks :: Double
  , totalImpressions :: Double
  , totalSpend :: Double
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Campaign where
  parseJSON = withObject "Campaign" $ \obj -> do
    accountId <- obj .: "account_id"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    endDate <- obj .: "end_date"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    name <- obj .: "name"
    objective <- obj .: "objective"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    startDate <- obj .: "start_date"
    status <- obj .: "status"
    totalBudget <- obj .: "total_budget"
    totalClicks <- obj .: "total_clicks"
    totalImpressions <- obj .: "total_impressions"
    totalSpend <- obj .: "total_spend"
    updatedAt <- obj .: "updated_at"
    pure $ Campaign{..}

instance ToJSON Campaign where
  toJSON Campaign{..} =
    object [
      "account_id" .= accountId,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "end_date" .= endDate,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "name" .= name,
      "objective" .= objective,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "start_date" .= startDate,
      "status" .= status,
      "total_budget" .= totalBudget,
      "total_clicks" .= totalClicks,
      "total_impressions" .= totalImpressions,
      "total_spend" .= totalSpend,
      "updated_at" .= updatedAt
    ]
