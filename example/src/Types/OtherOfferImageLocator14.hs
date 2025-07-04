{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator14 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator14 = OtherOfferImageLocator14
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator14 where
  parseJSON = withObject "OtherOfferImageLocator14" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator14{..}

instance ToJSON OtherOfferImageLocator14 where
  toJSON OtherOfferImageLocator14{..} =
    object [
      "media_location" .= mediaLocation
    ]
