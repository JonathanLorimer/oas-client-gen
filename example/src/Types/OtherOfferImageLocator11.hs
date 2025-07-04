{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator11 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator11 = OtherOfferImageLocator11
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator11 where
  parseJSON = withObject "OtherOfferImageLocator11" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator11{..}

instance ToJSON OtherOfferImageLocator11 where
  toJSON OtherOfferImageLocator11{..} =
    object [
      "media_location" .= mediaLocation
    ]
