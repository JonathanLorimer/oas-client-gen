{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator48 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator48 = OtherOfferImageLocator48
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator48 where
  parseJSON = withObject "OtherOfferImageLocator48" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator48{..}

instance ToJSON OtherOfferImageLocator48 where
  toJSON OtherOfferImageLocator48{..} =
    object [
      "media_location" .= mediaLocation
    ]
