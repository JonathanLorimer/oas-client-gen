{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator23 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator23 = OtherOfferImageLocator23
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator23 where
  parseJSON = withObject "OtherOfferImageLocator23" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator23{..}

instance ToJSON OtherOfferImageLocator23 where
  toJSON OtherOfferImageLocator23{..} =
    object [
      "media_location" .= mediaLocation
    ]
