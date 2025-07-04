{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator55 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator55 = OtherProductImageLocator55
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator55 where
  parseJSON = withObject "OtherProductImageLocator55" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator55{..}

instance ToJSON OtherProductImageLocator55 where
  toJSON OtherProductImageLocator55{..} =
    object [
      "media_location" .= mediaLocation
    ]
