{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainOfferImageLocator3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainOfferImageLocator3 = MainOfferImageLocator3
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainOfferImageLocator3 where
  parseJSON = withObject "MainOfferImageLocator3" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainOfferImageLocator3{..}

instance ToJSON MainOfferImageLocator3 where
  toJSON MainOfferImageLocator3{..} =
    object [
      "media_location" .= mediaLocation
    ]
