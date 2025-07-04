{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator88 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator88 = OtherProductImageLocator88
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator88 where
  parseJSON = withObject "OtherProductImageLocator88" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator88{..}

instance ToJSON OtherProductImageLocator88 where
  toJSON OtherProductImageLocator88{..} =
    object [
      "media_location" .= mediaLocation
    ]
