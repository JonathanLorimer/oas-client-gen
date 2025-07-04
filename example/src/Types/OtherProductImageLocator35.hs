{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator35 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator35 = OtherProductImageLocator35
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator35 where
  parseJSON = withObject "OtherProductImageLocator35" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator35{..}

instance ToJSON OtherProductImageLocator35 where
  toJSON OtherProductImageLocator35{..} =
    object [
      "media_location" .= mediaLocation
    ]
