{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator38 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator38 = OtherProductImageLocator38
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator38 where
  parseJSON = withObject "OtherProductImageLocator38" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator38{..}

instance ToJSON OtherProductImageLocator38 where
  toJSON OtherProductImageLocator38{..} =
    object [
      "media_location" .= mediaLocation
    ]
