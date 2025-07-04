{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainProductImageLocator1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainProductImageLocator1 = MainProductImageLocator1
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainProductImageLocator1 where
  parseJSON = withObject "MainProductImageLocator1" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainProductImageLocator1{..}

instance ToJSON MainProductImageLocator1 where
  toJSON MainProductImageLocator1{..} =
    object [
      "media_location" .= mediaLocation
    ]
