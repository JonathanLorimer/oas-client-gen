{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator16 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator16 = OtherProductImageLocator16
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator16 where
  parseJSON = withObject "OtherProductImageLocator16" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator16{..}

instance ToJSON OtherProductImageLocator16 where
  toJSON OtherProductImageLocator16{..} =
    object [
      "media_location" .= mediaLocation
    ]
