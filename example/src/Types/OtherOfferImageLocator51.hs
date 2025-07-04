{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator51 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator51 = OtherOfferImageLocator51
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator51 where
  parseJSON = withObject "OtherOfferImageLocator51" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator51{..}

instance ToJSON OtherOfferImageLocator51 where
  toJSON OtherOfferImageLocator51{..} =
    object [
      "media_location" .= mediaLocation
    ]
