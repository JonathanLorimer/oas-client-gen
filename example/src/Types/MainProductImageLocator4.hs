{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainProductImageLocator4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainProductImageLocator4 = MainProductImageLocator4
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainProductImageLocator4 where
  parseJSON = withObject "MainProductImageLocator4" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainProductImageLocator4{..}

instance ToJSON MainProductImageLocator4 where
  toJSON MainProductImageLocator4{..} =
    object [
      "media_location" .= mediaLocation
    ]
