{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator44 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator44 = OtherProductImageLocator44
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator44 where
  parseJSON = withObject "OtherProductImageLocator44" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator44{..}

instance ToJSON OtherProductImageLocator44 where
  toJSON OtherProductImageLocator44{..} =
    object [
      "media_location" .= mediaLocation
    ]
