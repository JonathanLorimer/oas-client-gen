{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator51 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator51 = OtherProductImageLocator51
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator51 where
  parseJSON = withObject "OtherProductImageLocator51" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator51{..}

instance ToJSON OtherProductImageLocator51 where
  toJSON OtherProductImageLocator51{..} =
    object [
      "media_location" .= mediaLocation
    ]
