{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator86 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator86 = OtherProductImageLocator86
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator86 where
  parseJSON = withObject "OtherProductImageLocator86" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator86{..}

instance ToJSON OtherProductImageLocator86 where
  toJSON OtherProductImageLocator86{..} =
    object [
      "media_location" .= mediaLocation
    ]
