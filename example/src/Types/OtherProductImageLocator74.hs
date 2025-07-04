{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator74 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator74 = OtherProductImageLocator74
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator74 where
  parseJSON = withObject "OtherProductImageLocator74" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator74{..}

instance ToJSON OtherProductImageLocator74 where
  toJSON OtherProductImageLocator74{..} =
    object [
      "media_location" .= mediaLocation
    ]
