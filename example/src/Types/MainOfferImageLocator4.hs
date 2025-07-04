{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainOfferImageLocator4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainOfferImageLocator4 = MainOfferImageLocator4
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainOfferImageLocator4 where
  parseJSON = withObject "MainOfferImageLocator4" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainOfferImageLocator4{..}

instance ToJSON MainOfferImageLocator4 where
  toJSON MainOfferImageLocator4{..} =
    object [
      "media_location" .= mediaLocation
    ]
