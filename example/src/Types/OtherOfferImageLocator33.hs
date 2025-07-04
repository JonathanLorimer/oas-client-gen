{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator33 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator33 = OtherOfferImageLocator33
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator33 where
  parseJSON = withObject "OtherOfferImageLocator33" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator33{..}

instance ToJSON OtherOfferImageLocator33 where
  toJSON OtherOfferImageLocator33{..} =
    object [
      "media_location" .= mediaLocation
    ]
