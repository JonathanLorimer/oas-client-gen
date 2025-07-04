{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator32 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator32 = OtherOfferImageLocator32
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator32 where
  parseJSON = withObject "OtherOfferImageLocator32" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator32{..}

instance ToJSON OtherOfferImageLocator32 where
  toJSON OtherOfferImageLocator32{..} =
    object [
      "media_location" .= mediaLocation
    ]
