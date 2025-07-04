{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainProductImageLocator8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainProductImageLocator8 = MainProductImageLocator8
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainProductImageLocator8 where
  parseJSON = withObject "MainProductImageLocator8" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainProductImageLocator8{..}

instance ToJSON MainProductImageLocator8 where
  toJSON MainProductImageLocator8{..} =
    object [
      "media_location" .= mediaLocation
    ]
