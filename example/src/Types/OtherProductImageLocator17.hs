{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator17 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator17 = OtherProductImageLocator17
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator17 where
  parseJSON = withObject "OtherProductImageLocator17" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator17{..}

instance ToJSON OtherProductImageLocator17 where
  toJSON OtherProductImageLocator17{..} =
    object [
      "media_location" .= mediaLocation
    ]
