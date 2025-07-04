{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator45 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator45 = OtherOfferImageLocator45
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator45 where
  parseJSON = withObject "OtherOfferImageLocator45" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator45{..}

instance ToJSON OtherOfferImageLocator45 where
  toJSON OtherOfferImageLocator45{..} =
    object [
      "media_location" .= mediaLocation
    ]
