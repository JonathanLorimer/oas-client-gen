{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListLocationResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Location (Location)
import Types.Subsidiaries2 (Subsidiaries2)

data ListLocationResponseWithConnection = ListLocationResponseWithConnection
  { connection :: Connection
  , locations :: [Location]
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListLocationResponseWithConnection where
  parseJSON = withObject "ListLocationResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    locations <- obj .: "locations"
    nextCursor <- obj .: "next_cursor"
    pure $ ListLocationResponseWithConnection{..}

instance ToJSON ListLocationResponseWithConnection where
  toJSON ListLocationResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "locations" .= locations,
      "next_cursor" .= nextCursor
    ]
