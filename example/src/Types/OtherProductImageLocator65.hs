{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator65 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator65 = OtherProductImageLocator65
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator65 where
  parseJSON = withObject "OtherProductImageLocator65" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator65{..}

instance ToJSON OtherProductImageLocator65 where
  toJSON OtherProductImageLocator65{..} =
    object [
      "media_location" .= mediaLocation
    ]
