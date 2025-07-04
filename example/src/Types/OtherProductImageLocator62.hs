{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator62 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator62 = OtherProductImageLocator62
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator62 where
  parseJSON = withObject "OtherProductImageLocator62" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator62{..}

instance ToJSON OtherProductImageLocator62 where
  toJSON OtherProductImageLocator62{..} =
    object [
      "media_location" .= mediaLocation
    ]
