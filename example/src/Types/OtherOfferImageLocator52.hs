{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator52 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator52 = OtherOfferImageLocator52
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator52 where
  parseJSON = withObject "OtherOfferImageLocator52" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator52{..}

instance ToJSON OtherOfferImageLocator52 where
  toJSON OtherOfferImageLocator52{..} =
    object [
      "media_location" .= mediaLocation
    ]
