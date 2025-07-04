{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator15 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator15 = OtherProductImageLocator15
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator15 where
  parseJSON = withObject "OtherProductImageLocator15" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator15{..}

instance ToJSON OtherProductImageLocator15 where
  toJSON OtherProductImageLocator15{..} =
    object [
      "media_location" .= mediaLocation
    ]
