{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainProductImageLocator6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainProductImageLocator6 = MainProductImageLocator6
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainProductImageLocator6 where
  parseJSON = withObject "MainProductImageLocator6" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainProductImageLocator6{..}

instance ToJSON MainProductImageLocator6 where
  toJSON MainProductImageLocator6{..} =
    object [
      "media_location" .= mediaLocation
    ]
