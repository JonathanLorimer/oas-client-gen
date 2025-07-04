{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator43 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator43 = OtherOfferImageLocator43
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator43 where
  parseJSON = withObject "OtherOfferImageLocator43" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator43{..}

instance ToJSON OtherOfferImageLocator43 where
  toJSON OtherOfferImageLocator43{..} =
    object [
      "media_location" .= mediaLocation
    ]
