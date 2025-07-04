{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator46 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator46 = OtherProductImageLocator46
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator46 where
  parseJSON = withObject "OtherProductImageLocator46" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator46{..}

instance ToJSON OtherProductImageLocator46 where
  toJSON OtherProductImageLocator46{..} =
    object [
      "media_location" .= mediaLocation
    ]
