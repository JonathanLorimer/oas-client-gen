{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator53 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator53 = OtherProductImageLocator53
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator53 where
  parseJSON = withObject "OtherProductImageLocator53" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator53{..}

instance ToJSON OtherProductImageLocator53 where
  toJSON OtherProductImageLocator53{..} =
    object [
      "media_location" .= mediaLocation
    ]
