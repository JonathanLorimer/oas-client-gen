{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator63 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator63 = OtherProductImageLocator63
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator63 where
  parseJSON = withObject "OtherProductImageLocator63" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator63{..}

instance ToJSON OtherProductImageLocator63 where
  toJSON OtherProductImageLocator63{..} =
    object [
      "media_location" .= mediaLocation
    ]
