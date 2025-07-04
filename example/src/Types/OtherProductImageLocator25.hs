{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator25 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator25 = OtherProductImageLocator25
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator25 where
  parseJSON = withObject "OtherProductImageLocator25" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator25{..}

instance ToJSON OtherProductImageLocator25 where
  toJSON OtherProductImageLocator25{..} =
    object [
      "media_location" .= mediaLocation
    ]
