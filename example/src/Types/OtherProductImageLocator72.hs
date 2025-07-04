{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator72 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator72 = OtherProductImageLocator72
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator72 where
  parseJSON = withObject "OtherProductImageLocator72" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator72{..}

instance ToJSON OtherProductImageLocator72 where
  toJSON OtherProductImageLocator72{..} =
    object [
      "media_location" .= mediaLocation
    ]
