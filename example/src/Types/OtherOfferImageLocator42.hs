{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator42 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator42 = OtherOfferImageLocator42
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator42 where
  parseJSON = withObject "OtherOfferImageLocator42" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator42{..}

instance ToJSON OtherOfferImageLocator42 where
  toJSON OtherOfferImageLocator42{..} =
    object [
      "media_location" .= mediaLocation
    ]
