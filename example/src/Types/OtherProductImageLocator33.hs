{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator33 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator33 = OtherProductImageLocator33
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator33 where
  parseJSON = withObject "OtherProductImageLocator33" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator33{..}

instance ToJSON OtherProductImageLocator33 where
  toJSON OtherProductImageLocator33{..} =
    object [
      "media_location" .= mediaLocation
    ]
