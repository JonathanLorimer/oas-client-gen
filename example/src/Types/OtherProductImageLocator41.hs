{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator41 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator41 = OtherProductImageLocator41
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator41 where
  parseJSON = withObject "OtherProductImageLocator41" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator41{..}

instance ToJSON OtherProductImageLocator41 where
  toJSON OtherProductImageLocator41{..} =
    object [
      "media_location" .= mediaLocation
    ]
