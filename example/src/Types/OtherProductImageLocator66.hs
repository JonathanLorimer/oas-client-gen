{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator66 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator66 = OtherProductImageLocator66
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator66 where
  parseJSON = withObject "OtherProductImageLocator66" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator66{..}

instance ToJSON OtherProductImageLocator66 where
  toJSON OtherProductImageLocator66{..} =
    object [
      "media_location" .= mediaLocation
    ]
