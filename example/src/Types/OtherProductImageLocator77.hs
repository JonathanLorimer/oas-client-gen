{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator77 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator77 = OtherProductImageLocator77
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator77 where
  parseJSON = withObject "OtherProductImageLocator77" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator77{..}

instance ToJSON OtherProductImageLocator77 where
  toJSON OtherProductImageLocator77{..} =
    object [
      "media_location" .= mediaLocation
    ]
