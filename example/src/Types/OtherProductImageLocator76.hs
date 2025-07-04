{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator76 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator76 = OtherProductImageLocator76
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator76 where
  parseJSON = withObject "OtherProductImageLocator76" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator76{..}

instance ToJSON OtherProductImageLocator76 where
  toJSON OtherProductImageLocator76{..} =
    object [
      "media_location" .= mediaLocation
    ]
