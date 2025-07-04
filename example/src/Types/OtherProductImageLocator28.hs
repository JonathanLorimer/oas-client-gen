{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator28 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator28 = OtherProductImageLocator28
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator28 where
  parseJSON = withObject "OtherProductImageLocator28" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator28{..}

instance ToJSON OtherProductImageLocator28 where
  toJSON OtherProductImageLocator28{..} =
    object [
      "media_location" .= mediaLocation
    ]
