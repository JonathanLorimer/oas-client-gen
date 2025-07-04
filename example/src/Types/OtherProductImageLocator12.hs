{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator12 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator12 = OtherProductImageLocator12
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator12 where
  parseJSON = withObject "OtherProductImageLocator12" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator12{..}

instance ToJSON OtherProductImageLocator12 where
  toJSON OtherProductImageLocator12{..} =
    object [
      "media_location" .= mediaLocation
    ]
