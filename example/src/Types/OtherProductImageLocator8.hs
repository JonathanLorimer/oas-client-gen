{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator8 = OtherProductImageLocator8
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator8 where
  parseJSON = withObject "OtherProductImageLocator8" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator8{..}

instance ToJSON OtherProductImageLocator8 where
  toJSON OtherProductImageLocator8{..} =
    object [
      "media_location" .= mediaLocation
    ]
