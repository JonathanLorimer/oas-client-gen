{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator47 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator47 = OtherProductImageLocator47
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator47 where
  parseJSON = withObject "OtherProductImageLocator47" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator47{..}

instance ToJSON OtherProductImageLocator47 where
  toJSON OtherProductImageLocator47{..} =
    object [
      "media_location" .= mediaLocation
    ]
