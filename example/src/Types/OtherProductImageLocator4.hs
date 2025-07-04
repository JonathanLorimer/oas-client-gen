{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator4 = OtherProductImageLocator4
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator4 where
  parseJSON = withObject "OtherProductImageLocator4" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator4{..}

instance ToJSON OtherProductImageLocator4 where
  toJSON OtherProductImageLocator4{..} =
    object [
      "media_location" .= mediaLocation
    ]
