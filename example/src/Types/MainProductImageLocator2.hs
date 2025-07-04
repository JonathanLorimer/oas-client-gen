{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainProductImageLocator2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainProductImageLocator2 = MainProductImageLocator2
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainProductImageLocator2 where
  parseJSON = withObject "MainProductImageLocator2" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainProductImageLocator2{..}

instance ToJSON MainProductImageLocator2 where
  toJSON MainProductImageLocator2{..} =
    object [
      "media_location" .= mediaLocation
    ]
