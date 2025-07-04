{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator57 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator57 = OtherProductImageLocator57
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator57 where
  parseJSON = withObject "OtherProductImageLocator57" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator57{..}

instance ToJSON OtherProductImageLocator57 where
  toJSON OtherProductImageLocator57{..} =
    object [
      "media_location" .= mediaLocation
    ]
