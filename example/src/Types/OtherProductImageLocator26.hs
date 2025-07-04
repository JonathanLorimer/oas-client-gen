{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator26 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator26 = OtherProductImageLocator26
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator26 where
  parseJSON = withObject "OtherProductImageLocator26" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator26{..}

instance ToJSON OtherProductImageLocator26 where
  toJSON OtherProductImageLocator26{..} =
    object [
      "media_location" .= mediaLocation
    ]
