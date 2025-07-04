{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainOfferImageLocator7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainOfferImageLocator7 = MainOfferImageLocator7
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainOfferImageLocator7 where
  parseJSON = withObject "MainOfferImageLocator7" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainOfferImageLocator7{..}

instance ToJSON MainOfferImageLocator7 where
  toJSON MainOfferImageLocator7{..} =
    object [
      "media_location" .= mediaLocation
    ]
