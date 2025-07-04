{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator53 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator53 = OtherOfferImageLocator53
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator53 where
  parseJSON = withObject "OtherOfferImageLocator53" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator53{..}

instance ToJSON OtherOfferImageLocator53 where
  toJSON OtherOfferImageLocator53{..} =
    object [
      "media_location" .= mediaLocation
    ]
