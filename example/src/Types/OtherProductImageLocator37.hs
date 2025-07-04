{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator37 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator37 = OtherProductImageLocator37
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator37 where
  parseJSON = withObject "OtherProductImageLocator37" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator37{..}

instance ToJSON OtherProductImageLocator37 where
  toJSON OtherProductImageLocator37{..} =
    object [
      "media_location" .= mediaLocation
    ]
