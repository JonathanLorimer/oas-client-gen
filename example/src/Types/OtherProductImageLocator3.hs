{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator3 = OtherProductImageLocator3
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator3 where
  parseJSON = withObject "OtherProductImageLocator3" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator3{..}

instance ToJSON OtherProductImageLocator3 where
  toJSON OtherProductImageLocator3{..} =
    object [
      "media_location" .= mediaLocation
    ]
