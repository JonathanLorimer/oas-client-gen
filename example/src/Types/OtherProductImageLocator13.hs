{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator13 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator13 = OtherProductImageLocator13
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator13 where
  parseJSON = withObject "OtherProductImageLocator13" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator13{..}

instance ToJSON OtherProductImageLocator13 where
  toJSON OtherProductImageLocator13{..} =
    object [
      "media_location" .= mediaLocation
    ]
