{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainOfferImageLocator2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainOfferImageLocator2 = MainOfferImageLocator2
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainOfferImageLocator2 where
  parseJSON = withObject "MainOfferImageLocator2" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainOfferImageLocator2{..}

instance ToJSON MainOfferImageLocator2 where
  toJSON MainOfferImageLocator2{..} =
    object [
      "media_location" .= mediaLocation
    ]
