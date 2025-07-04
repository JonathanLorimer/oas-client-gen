{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator84 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator84 = OtherProductImageLocator84
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator84 where
  parseJSON = withObject "OtherProductImageLocator84" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator84{..}

instance ToJSON OtherProductImageLocator84 where
  toJSON OtherProductImageLocator84{..} =
    object [
      "media_location" .= mediaLocation
    ]
