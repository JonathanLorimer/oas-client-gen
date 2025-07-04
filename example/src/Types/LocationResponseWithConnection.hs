{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LocationResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LocationResponseWithConnection = LocationResponseWithConnection
  { connection :: Connection
  , location :: Location
  }
  deriving (Show, Eq)

instance FromJSON LocationResponseWithConnection where
  parseJSON = withObject "LocationResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    location <- obj .: "location"
    pure $ LocationResponseWithConnection{..}

instance ToJSON LocationResponseWithConnection where
  toJSON LocationResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "location" .= location
    ]
