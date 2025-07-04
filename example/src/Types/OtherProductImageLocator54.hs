{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator54 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator54 = OtherProductImageLocator54
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator54 where
  parseJSON = withObject "OtherProductImageLocator54" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator54{..}

instance ToJSON OtherProductImageLocator54 where
  toJSON OtherProductImageLocator54{..} =
    object [
      "media_location" .= mediaLocation
    ]
