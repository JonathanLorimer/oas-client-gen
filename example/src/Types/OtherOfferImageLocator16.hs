{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator16 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator16 = OtherOfferImageLocator16
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator16 where
  parseJSON = withObject "OtherOfferImageLocator16" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator16{..}

instance ToJSON OtherOfferImageLocator16 where
  toJSON OtherOfferImageLocator16{..} =
    object [
      "media_location" .= mediaLocation
    ]
