{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainProductImageLocator where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainProductImageLocator = MainProductImageLocator
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainProductImageLocator where
  parseJSON = withObject "MainProductImageLocator" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainProductImageLocator{..}

instance ToJSON MainProductImageLocator where
  toJSON MainProductImageLocator{..} =
    object [
      "media_location" .= mediaLocation
    ]
