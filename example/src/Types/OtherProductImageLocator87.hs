{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator87 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator87 = OtherProductImageLocator87
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator87 where
  parseJSON = withObject "OtherProductImageLocator87" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator87{..}

instance ToJSON OtherProductImageLocator87 where
  toJSON OtherProductImageLocator87{..} =
    object [
      "media_location" .= mediaLocation
    ]
