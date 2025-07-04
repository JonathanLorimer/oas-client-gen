{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator23 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator23 = OtherProductImageLocator23
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator23 where
  parseJSON = withObject "OtherProductImageLocator23" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator23{..}

instance ToJSON OtherProductImageLocator23 where
  toJSON OtherProductImageLocator23{..} =
    object [
      "media_location" .= mediaLocation
    ]
