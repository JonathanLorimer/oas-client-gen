{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainProductImageLocator7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainProductImageLocator7 = MainProductImageLocator7
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainProductImageLocator7 where
  parseJSON = withObject "MainProductImageLocator7" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainProductImageLocator7{..}

instance ToJSON MainProductImageLocator7 where
  toJSON MainProductImageLocator7{..} =
    object [
      "media_location" .= mediaLocation
    ]
