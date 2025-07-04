{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator28 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator28 = OtherOfferImageLocator28
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator28 where
  parseJSON = withObject "OtherOfferImageLocator28" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator28{..}

instance ToJSON OtherOfferImageLocator28 where
  toJSON OtherOfferImageLocator28{..} =
    object [
      "media_location" .= mediaLocation
    ]
