{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.MainOfferImageLocator1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data MainOfferImageLocator1 = MainOfferImageLocator1
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON MainOfferImageLocator1 where
  parseJSON = withObject "MainOfferImageLocator1" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ MainOfferImageLocator1{..}

instance ToJSON MainOfferImageLocator1 where
  toJSON MainOfferImageLocator1{..} =
    object [
      "media_location" .= mediaLocation
    ]
