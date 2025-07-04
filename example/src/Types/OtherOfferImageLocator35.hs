{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator35 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator35 = OtherOfferImageLocator35
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator35 where
  parseJSON = withObject "OtherOfferImageLocator35" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator35{..}

instance ToJSON OtherOfferImageLocator35 where
  toJSON OtherOfferImageLocator35{..} =
    object [
      "media_location" .= mediaLocation
    ]
