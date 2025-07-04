{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator71 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator71 = OtherProductImageLocator71
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator71 where
  parseJSON = withObject "OtherProductImageLocator71" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator71{..}

instance ToJSON OtherProductImageLocator71 where
  toJSON OtherProductImageLocator71{..} =
    object [
      "media_location" .= mediaLocation
    ]
