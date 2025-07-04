{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CampaignDaily where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data CampaignDaily = CampaignDaily
  { campaignId :: Maybe Text
  , clicks :: Double
  , dailyBudget :: Maybe Double
  , date :: Text
  , id :: Text
  , impressions :: Double
  , lastSyncedAt :: Text
  , platformData :: Map Text Value
  , spend :: Double
  }
  deriving (Show, Eq)

instance FromJSON CampaignDaily where
  parseJSON = withObject "CampaignDaily" $ \obj -> do
    campaignId <- obj .: "campaign_id"
    clicks <- obj .: "clicks"
    dailyBudget <- obj .: "daily_budget"
    date <- obj .: "date"
    id <- obj .: "id"
    impressions <- obj .: "impressions"
    lastSyncedAt <- obj .: "last_synced_at"
    platformData <- obj .: "platform_data"
    spend <- obj .: "spend"
    pure $ CampaignDaily{..}

instance ToJSON CampaignDaily where
  toJSON CampaignDaily{..} =
    object [
      "campaign_id" .= campaignId,
      "clicks" .= clicks,
      "daily_budget" .= dailyBudget,
      "date" .= date,
      "id" .= id,
      "impressions" .= impressions,
      "last_synced_at" .= lastSyncedAt,
      "platform_data" .= platformData,
      "spend" .= spend
    ]
