{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator5 = OtherProductImageLocator5
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator5 where
  parseJSON = withObject "OtherProductImageLocator5" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator5{..}

instance ToJSON OtherProductImageLocator5 where
  toJSON OtherProductImageLocator5{..} =
    object [
      "media_location" .= mediaLocation
    ]
