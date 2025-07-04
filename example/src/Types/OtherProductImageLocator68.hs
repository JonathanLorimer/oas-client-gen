{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator68 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator68 = OtherProductImageLocator68
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator68 where
  parseJSON = withObject "OtherProductImageLocator68" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator68{..}

instance ToJSON OtherProductImageLocator68 where
  toJSON OtherProductImageLocator68{..} =
    object [
      "media_location" .= mediaLocation
    ]
