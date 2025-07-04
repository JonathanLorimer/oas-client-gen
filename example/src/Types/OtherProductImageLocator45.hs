{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator45 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator45 = OtherProductImageLocator45
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator45 where
  parseJSON = withObject "OtherProductImageLocator45" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator45{..}

instance ToJSON OtherProductImageLocator45 where
  toJSON OtherProductImageLocator45{..} =
    object [
      "media_location" .= mediaLocation
    ]
