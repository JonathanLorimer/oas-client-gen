{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator31 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator31 = OtherProductImageLocator31
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator31 where
  parseJSON = withObject "OtherProductImageLocator31" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator31{..}

instance ToJSON OtherProductImageLocator31 where
  toJSON OtherProductImageLocator31{..} =
    object [
      "media_location" .= mediaLocation
    ]
