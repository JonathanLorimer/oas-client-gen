{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator14 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator14 = OtherProductImageLocator14
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator14 where
  parseJSON = withObject "OtherProductImageLocator14" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator14{..}

instance ToJSON OtherProductImageLocator14 where
  toJSON OtherProductImageLocator14{..} =
    object [
      "media_location" .= mediaLocation
    ]
