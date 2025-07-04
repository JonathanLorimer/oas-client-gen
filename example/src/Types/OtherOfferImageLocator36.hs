{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator36 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator36 = OtherOfferImageLocator36
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator36 where
  parseJSON = withObject "OtherOfferImageLocator36" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator36{..}

instance ToJSON OtherOfferImageLocator36 where
  toJSON OtherOfferImageLocator36{..} =
    object [
      "media_location" .= mediaLocation
    ]
