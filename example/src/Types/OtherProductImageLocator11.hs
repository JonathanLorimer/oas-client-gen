{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator11 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator11 = OtherProductImageLocator11
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator11 where
  parseJSON = withObject "OtherProductImageLocator11" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator11{..}

instance ToJSON OtherProductImageLocator11 where
  toJSON OtherProductImageLocator11{..} =
    object [
      "media_location" .= mediaLocation
    ]
