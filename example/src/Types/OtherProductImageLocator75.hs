{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator75 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator75 = OtherProductImageLocator75
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator75 where
  parseJSON = withObject "OtherProductImageLocator75" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator75{..}

instance ToJSON OtherProductImageLocator75 where
  toJSON OtherProductImageLocator75{..} =
    object [
      "media_location" .= mediaLocation
    ]
