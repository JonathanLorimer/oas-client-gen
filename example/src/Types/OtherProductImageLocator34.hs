{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator34 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator34 = OtherProductImageLocator34
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator34 where
  parseJSON = withObject "OtherProductImageLocator34" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator34{..}

instance ToJSON OtherProductImageLocator34 where
  toJSON OtherProductImageLocator34{..} =
    object [
      "media_location" .= mediaLocation
    ]
