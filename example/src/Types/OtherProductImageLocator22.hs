{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator22 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator22 = OtherProductImageLocator22
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator22 where
  parseJSON = withObject "OtherProductImageLocator22" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator22{..}

instance ToJSON OtherProductImageLocator22 where
  toJSON OtherProductImageLocator22{..} =
    object [
      "media_location" .= mediaLocation
    ]
