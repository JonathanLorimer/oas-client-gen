{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator17 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator17 = OtherOfferImageLocator17
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator17 where
  parseJSON = withObject "OtherOfferImageLocator17" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator17{..}

instance ToJSON OtherOfferImageLocator17 where
  toJSON OtherOfferImageLocator17{..} =
    object [
      "media_location" .= mediaLocation
    ]
