{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator21 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator21 = OtherOfferImageLocator21
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator21 where
  parseJSON = withObject "OtherOfferImageLocator21" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator21{..}

instance ToJSON OtherOfferImageLocator21 where
  toJSON OtherOfferImageLocator21{..} =
    object [
      "media_location" .= mediaLocation
    ]
