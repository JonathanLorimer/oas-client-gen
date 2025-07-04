{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator15 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator15 = OtherOfferImageLocator15
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator15 where
  parseJSON = withObject "OtherOfferImageLocator15" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator15{..}

instance ToJSON OtherOfferImageLocator15 where
  toJSON OtherOfferImageLocator15{..} =
    object [
      "media_location" .= mediaLocation
    ]
