{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListCampaignDailyResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.CampaignDaily (CampaignDaily)

data ListCampaignDailyResponseWithConnection = ListCampaignDailyResponseWithConnection
  { campaignDailies :: [CampaignDaily]
  , connection :: Connection
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListCampaignDailyResponseWithConnection where
  parseJSON = withObject "ListCampaignDailyResponseWithConnection" $ \obj -> do
    campaignDailies <- obj .: "campaign_dailies"
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    pure $ ListCampaignDailyResponseWithConnection{..}

instance ToJSON ListCampaignDailyResponseWithConnection where
  toJSON ListCampaignDailyResponseWithConnection{..} =
    object [
      "campaign_dailies" .= campaignDailies,
      "connection" .= connection,
      "next_cursor" .= nextCursor
    ]
