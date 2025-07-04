{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator3 = OtherOfferImageLocator3
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator3 where
  parseJSON = withObject "OtherOfferImageLocator3" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator3{..}

instance ToJSON OtherOfferImageLocator3 where
  toJSON OtherOfferImageLocator3{..} =
    object [
      "media_location" .= mediaLocation
    ]
