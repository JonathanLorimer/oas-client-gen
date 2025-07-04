{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator4 = OtherOfferImageLocator4
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator4 where
  parseJSON = withObject "OtherOfferImageLocator4" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator4{..}

instance ToJSON OtherOfferImageLocator4 where
  toJSON OtherOfferImageLocator4{..} =
    object [
      "media_location" .= mediaLocation
    ]
