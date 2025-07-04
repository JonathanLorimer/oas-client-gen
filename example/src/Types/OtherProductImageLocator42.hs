{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator42 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator42 = OtherProductImageLocator42
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator42 where
  parseJSON = withObject "OtherProductImageLocator42" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator42{..}

instance ToJSON OtherProductImageLocator42 where
  toJSON OtherProductImageLocator42{..} =
    object [
      "media_location" .= mediaLocation
    ]
