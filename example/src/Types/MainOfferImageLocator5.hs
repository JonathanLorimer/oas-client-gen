{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainOfferImageLocator5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainOfferImageLocator5 = MainOfferImageLocator5
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainOfferImageLocator5 where
  parseJSON = withObject "MainOfferImageLocator5" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainOfferImageLocator5{..}

instance ToJSON MainOfferImageLocator5 where
  toJSON MainOfferImageLocator5{..} =
    object [
      "media_location" .= mediaLocation
    ]
