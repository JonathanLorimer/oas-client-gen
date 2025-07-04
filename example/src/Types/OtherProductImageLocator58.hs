{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator58 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator58 = OtherProductImageLocator58
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator58 where
  parseJSON = withObject "OtherProductImageLocator58" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator58{..}

instance ToJSON OtherProductImageLocator58 where
  toJSON OtherProductImageLocator58{..} =
    object [
      "media_location" .= mediaLocation
    ]
