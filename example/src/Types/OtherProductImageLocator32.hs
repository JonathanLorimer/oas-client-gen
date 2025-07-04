{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator32 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator32 = OtherProductImageLocator32
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator32 where
  parseJSON = withObject "OtherProductImageLocator32" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator32{..}

instance ToJSON OtherProductImageLocator32 where
  toJSON OtherProductImageLocator32{..} =
    object [
      "media_location" .= mediaLocation
    ]
