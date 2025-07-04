{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator5 = OtherOfferImageLocator5
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator5 where
  parseJSON = withObject "OtherOfferImageLocator5" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator5{..}

instance ToJSON OtherOfferImageLocator5 where
  toJSON OtherOfferImageLocator5{..} =
    object [
      "media_location" .= mediaLocation
    ]
