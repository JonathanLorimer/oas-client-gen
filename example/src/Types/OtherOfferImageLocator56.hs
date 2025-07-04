{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator56 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator56 = OtherOfferImageLocator56
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator56 where
  parseJSON = withObject "OtherOfferImageLocator56" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator56{..}

instance ToJSON OtherOfferImageLocator56 where
  toJSON OtherOfferImageLocator56{..} =
    object [
      "media_location" .= mediaLocation
    ]
