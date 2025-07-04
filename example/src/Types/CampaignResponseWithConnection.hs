{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CampaignResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CampaignResponseWithConnection = CampaignResponseWithConnection
  { campaign :: Campaign
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON CampaignResponseWithConnection where
  parseJSON = withObject "CampaignResponseWithConnection" $ \obj -> do
    campaign <- obj .: "campaign"
    connection <- obj .: "connection"
    pure $ CampaignResponseWithConnection{..}

instance ToJSON CampaignResponseWithConnection where
  toJSON CampaignResponseWithConnection{..} =
    object [
      "campaign" .= campaign,
      "connection" .= connection
    ]
