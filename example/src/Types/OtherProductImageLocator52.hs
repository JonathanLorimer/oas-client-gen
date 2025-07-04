{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator52 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator52 = OtherProductImageLocator52
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator52 where
  parseJSON = withObject "OtherProductImageLocator52" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator52{..}

instance ToJSON OtherProductImageLocator52 where
  toJSON OtherProductImageLocator52{..} =
    object [
      "media_location" .= mediaLocation
    ]
