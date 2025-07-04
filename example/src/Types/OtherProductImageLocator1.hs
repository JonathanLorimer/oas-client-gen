{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator1 = OtherProductImageLocator1
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator1 where
  parseJSON = withObject "OtherProductImageLocator1" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator1{..}

instance ToJSON OtherProductImageLocator1 where
  toJSON OtherProductImageLocator1{..} =
    object [
      "media_location" .= mediaLocation
    ]
