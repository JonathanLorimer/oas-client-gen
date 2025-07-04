{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator27 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator27 = OtherOfferImageLocator27
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator27 where
  parseJSON = withObject "OtherOfferImageLocator27" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator27{..}

instance ToJSON OtherOfferImageLocator27 where
  toJSON OtherOfferImageLocator27{..} =
    object [
      "media_location" .= mediaLocation
    ]
