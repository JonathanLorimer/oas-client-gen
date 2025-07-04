{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator83 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator83 = OtherProductImageLocator83
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator83 where
  parseJSON = withObject "OtherProductImageLocator83" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator83{..}

instance ToJSON OtherProductImageLocator83 where
  toJSON OtherProductImageLocator83{..} =
    object [
      "media_location" .= mediaLocation
    ]
