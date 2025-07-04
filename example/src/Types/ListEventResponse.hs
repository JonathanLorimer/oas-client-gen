{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListEventResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Event (Event)

data ListEventResponse = ListEventResponse
  { events :: [Event]
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListEventResponse where
  parseJSON = withObject "ListEventResponse" $ \obj -> do
    events <- obj .: "events"
    nextCursor <- obj .: "next_cursor"
    pure $ ListEventResponse{..}

instance ToJSON ListEventResponse where
  toJSON ListEventResponse{..} =
    object [
      "events" .= events,
      "next_cursor" .= nextCursor
    ]
