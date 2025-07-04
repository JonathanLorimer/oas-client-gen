{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListCampaignResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Campaign (Campaign)

data ListCampaignResponseWithConnection = ListCampaignResponseWithConnection
  { campaigns :: [Campaign]
  , connection :: Connection
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListCampaignResponseWithConnection where
  parseJSON = withObject "ListCampaignResponseWithConnection" $ \obj -> do
    campaigns <- obj .: "campaigns"
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    pure $ ListCampaignResponseWithConnection{..}

instance ToJSON ListCampaignResponseWithConnection where
  toJSON ListCampaignResponseWithConnection{..} =
    object [
      "campaigns" .= campaigns,
      "connection" .= connection,
      "next_cursor" .= nextCursor
    ]
