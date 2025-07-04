{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainProductImageLocator3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainProductImageLocator3 = MainProductImageLocator3
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainProductImageLocator3 where
  parseJSON = withObject "MainProductImageLocator3" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainProductImageLocator3{..}

instance ToJSON MainProductImageLocator3 where
  toJSON MainProductImageLocator3{..} =
    object [
      "media_location" .= mediaLocation
    ]
