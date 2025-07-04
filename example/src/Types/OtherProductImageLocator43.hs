{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator43 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator43 = OtherProductImageLocator43
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator43 where
  parseJSON = withObject "OtherProductImageLocator43" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator43{..}

instance ToJSON OtherProductImageLocator43 where
  toJSON OtherProductImageLocator43{..} =
    object [
      "media_location" .= mediaLocation
    ]
