{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainOfferImageLocator where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainOfferImageLocator = MainOfferImageLocator
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainOfferImageLocator where
  parseJSON = withObject "MainOfferImageLocator" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainOfferImageLocator{..}

instance ToJSON MainOfferImageLocator where
  toJSON MainOfferImageLocator{..} =
    object [
      "media_location" .= mediaLocation
    ]
