{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator54 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator54 = OtherOfferImageLocator54
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator54 where
  parseJSON = withObject "OtherOfferImageLocator54" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator54{..}

instance ToJSON OtherOfferImageLocator54 where
  toJSON OtherOfferImageLocator54{..} =
    object [
      "media_location" .= mediaLocation
    ]
