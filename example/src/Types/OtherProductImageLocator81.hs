{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator81 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator81 = OtherProductImageLocator81
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator81 where
  parseJSON = withObject "OtherProductImageLocator81" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator81{..}

instance ToJSON OtherProductImageLocator81 where
  toJSON OtherProductImageLocator81{..} =
    object [
      "media_location" .= mediaLocation
    ]
