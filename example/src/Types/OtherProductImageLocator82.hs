{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator82 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator82 = OtherProductImageLocator82
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator82 where
  parseJSON = withObject "OtherProductImageLocator82" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator82{..}

instance ToJSON OtherProductImageLocator82 where
  toJSON OtherProductImageLocator82{..} =
    object [
      "media_location" .= mediaLocation
    ]
