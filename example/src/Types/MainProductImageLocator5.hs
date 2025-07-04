{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainProductImageLocator5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainProductImageLocator5 = MainProductImageLocator5
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainProductImageLocator5 where
  parseJSON = withObject "MainProductImageLocator5" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainProductImageLocator5{..}

instance ToJSON MainProductImageLocator5 where
  toJSON MainProductImageLocator5{..} =
    object [
      "media_location" .= mediaLocation
    ]
