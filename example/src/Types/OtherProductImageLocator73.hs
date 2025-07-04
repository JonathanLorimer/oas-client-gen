{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator73 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator73 = OtherProductImageLocator73
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator73 where
  parseJSON = withObject "OtherProductImageLocator73" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator73{..}

instance ToJSON OtherProductImageLocator73 where
  toJSON OtherProductImageLocator73{..} =
    object [
      "media_location" .= mediaLocation
    ]
