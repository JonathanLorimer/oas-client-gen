{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator61 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator61 = OtherProductImageLocator61
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator61 where
  parseJSON = withObject "OtherProductImageLocator61" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator61{..}

instance ToJSON OtherProductImageLocator61 where
  toJSON OtherProductImageLocator61{..} =
    object [
      "media_location" .= mediaLocation
    ]
