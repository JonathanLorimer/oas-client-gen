{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator2 = OtherOfferImageLocator2
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator2 where
  parseJSON = withObject "OtherOfferImageLocator2" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator2{..}

instance ToJSON OtherOfferImageLocator2 where
  toJSON OtherOfferImageLocator2{..} =
    object [
      "media_location" .= mediaLocation
    ]
