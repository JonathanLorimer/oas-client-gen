{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator48 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator48 = OtherProductImageLocator48
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator48 where
  parseJSON = withObject "OtherProductImageLocator48" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator48{..}

instance ToJSON OtherProductImageLocator48 where
  toJSON OtherProductImageLocator48{..} =
    object [
      "media_location" .= mediaLocation
    ]
