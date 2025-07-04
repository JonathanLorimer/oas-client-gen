{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator26 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator26 = OtherOfferImageLocator26
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator26 where
  parseJSON = withObject "OtherOfferImageLocator26" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator26{..}

instance ToJSON OtherOfferImageLocator26 where
  toJSON OtherOfferImageLocator26{..} =
    object [
      "media_location" .= mediaLocation
    ]
