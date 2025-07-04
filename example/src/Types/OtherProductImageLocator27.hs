{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator27 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator27 = OtherProductImageLocator27
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator27 where
  parseJSON = withObject "OtherProductImageLocator27" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator27{..}

instance ToJSON OtherProductImageLocator27 where
  toJSON OtherProductImageLocator27{..} =
    object [
      "media_location" .= mediaLocation
    ]
