{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator67 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator67 = OtherProductImageLocator67
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator67 where
  parseJSON = withObject "OtherProductImageLocator67" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator67{..}

instance ToJSON OtherProductImageLocator67 where
  toJSON OtherProductImageLocator67{..} =
    object [
      "media_location" .= mediaLocation
    ]
