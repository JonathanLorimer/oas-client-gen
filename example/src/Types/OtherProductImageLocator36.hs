{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator36 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator36 = OtherProductImageLocator36
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator36 where
  parseJSON = withObject "OtherProductImageLocator36" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator36{..}

instance ToJSON OtherProductImageLocator36 where
  toJSON OtherProductImageLocator36{..} =
    object [
      "media_location" .= mediaLocation
    ]
