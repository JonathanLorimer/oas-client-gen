{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator7 = OtherProductImageLocator7
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator7 where
  parseJSON = withObject "OtherProductImageLocator7" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator7{..}

instance ToJSON OtherProductImageLocator7 where
  toJSON OtherProductImageLocator7{..} =
    object [
      "media_location" .= mediaLocation
    ]
