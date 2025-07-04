{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator21 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator21 = OtherProductImageLocator21
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator21 where
  parseJSON = withObject "OtherProductImageLocator21" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator21{..}

instance ToJSON OtherProductImageLocator21 where
  toJSON OtherProductImageLocator21{..} =
    object [
      "media_location" .= mediaLocation
    ]
