{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainOfferImageLocator6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainOfferImageLocator6 = MainOfferImageLocator6
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainOfferImageLocator6 where
  parseJSON = withObject "MainOfferImageLocator6" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainOfferImageLocator6{..}

instance ToJSON MainOfferImageLocator6 where
  toJSON MainOfferImageLocator6{..} =
    object [
      "media_location" .= mediaLocation
    ]
