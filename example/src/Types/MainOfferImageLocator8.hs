{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainOfferImageLocator8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainOfferImageLocator8 = MainOfferImageLocator8
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainOfferImageLocator8 where
  parseJSON = withObject "MainOfferImageLocator8" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainOfferImageLocator8{..}

instance ToJSON MainOfferImageLocator8 where
  toJSON MainOfferImageLocator8{..} =
    object [
      "media_location" .= mediaLocation
    ]
