{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator6 = OtherProductImageLocator6
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator6 where
  parseJSON = withObject "OtherProductImageLocator6" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator6{..}

instance ToJSON OtherProductImageLocator6 where
  toJSON OtherProductImageLocator6{..} =
    object [
      "media_location" .= mediaLocation
    ]
