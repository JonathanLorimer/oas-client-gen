{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator64 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator64 = OtherProductImageLocator64
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator64 where
  parseJSON = withObject "OtherProductImageLocator64" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator64{..}

instance ToJSON OtherProductImageLocator64 where
  toJSON OtherProductImageLocator64{..} =
    object [
      "media_location" .= mediaLocation
    ]
