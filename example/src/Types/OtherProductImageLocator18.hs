{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator18 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator18 = OtherProductImageLocator18
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator18 where
  parseJSON = withObject "OtherProductImageLocator18" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator18{..}

instance ToJSON OtherProductImageLocator18 where
  toJSON OtherProductImageLocator18{..} =
    object [
      "media_location" .= mediaLocation
    ]
