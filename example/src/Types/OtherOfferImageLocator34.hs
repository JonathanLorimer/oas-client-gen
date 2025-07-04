{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator34 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator34 = OtherOfferImageLocator34
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator34 where
  parseJSON = withObject "OtherOfferImageLocator34" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator34{..}

instance ToJSON OtherOfferImageLocator34 where
  toJSON OtherOfferImageLocator34{..} =
    object [
      "media_location" .= mediaLocation
    ]
