{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator13 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator13 = OtherOfferImageLocator13
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator13 where
  parseJSON = withObject "OtherOfferImageLocator13" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator13{..}

instance ToJSON OtherOfferImageLocator13 where
  toJSON OtherOfferImageLocator13{..} =
    object [
      "media_location" .= mediaLocation
    ]
