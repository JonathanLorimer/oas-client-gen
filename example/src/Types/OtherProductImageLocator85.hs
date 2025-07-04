{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator85 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator85 = OtherProductImageLocator85
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator85 where
  parseJSON = withObject "OtherProductImageLocator85" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator85{..}

instance ToJSON OtherProductImageLocator85 where
  toJSON OtherProductImageLocator85{..} =
    object [
      "media_location" .= mediaLocation
    ]
