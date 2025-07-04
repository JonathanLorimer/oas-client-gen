{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator47 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator47 = OtherOfferImageLocator47
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator47 where
  parseJSON = withObject "OtherOfferImageLocator47" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator47{..}

instance ToJSON OtherOfferImageLocator47 where
  toJSON OtherOfferImageLocator47{..} =
    object [
      "media_location" .= mediaLocation
    ]
