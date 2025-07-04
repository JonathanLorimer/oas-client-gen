{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator2 = OtherProductImageLocator2
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator2 where
  parseJSON = withObject "OtherProductImageLocator2" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator2{..}

instance ToJSON OtherProductImageLocator2 where
  toJSON OtherProductImageLocator2{..} =
    object [
      "media_location" .= mediaLocation
    ]
