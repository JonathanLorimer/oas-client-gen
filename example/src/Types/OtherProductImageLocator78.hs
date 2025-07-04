{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator78 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator78 = OtherProductImageLocator78
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator78 where
  parseJSON = withObject "OtherProductImageLocator78" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator78{..}

instance ToJSON OtherProductImageLocator78 where
  toJSON OtherProductImageLocator78{..} =
    object [
      "media_location" .= mediaLocation
    ]
