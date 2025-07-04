{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator55 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator55 = OtherOfferImageLocator55
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator55 where
  parseJSON = withObject "OtherOfferImageLocator55" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator55{..}

instance ToJSON OtherOfferImageLocator55 where
  toJSON OtherOfferImageLocator55{..} =
    object [
      "media_location" .= mediaLocation
    ]
