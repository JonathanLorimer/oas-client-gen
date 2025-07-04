{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator56 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator56 = OtherProductImageLocator56
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator56 where
  parseJSON = withObject "OtherProductImageLocator56" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator56{..}

instance ToJSON OtherProductImageLocator56 where
  toJSON OtherProductImageLocator56{..} =
    object [
      "media_location" .= mediaLocation
    ]
