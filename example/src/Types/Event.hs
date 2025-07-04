{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Event where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data Event = Event
  { data_ :: Map Text Value
  , id :: Text
  , lastSyncedAt :: Text
  , resource :: Text
  , type_ :: Text
  }
  deriving (Show, Eq)

instance FromJSON Event where
  parseJSON = withObject "Event" $ \obj -> do
    data_ <- obj .: "data"
    id <- obj .: "id"
    lastSyncedAt <- obj .: "last_synced_at"
    resource <- obj .: "resource"
    type_ <- obj .: "type"
    pure $ Event{..}

instance ToJSON Event where
  toJSON Event{..} =
    object [
      "data" .= data_,
      "id" .= id,
      "last_synced_at" .= lastSyncedAt,
      "resource" .= resource,
      "type" .= type_
    ]
