{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator41 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator41 = OtherOfferImageLocator41
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator41 where
  parseJSON = withObject "OtherOfferImageLocator41" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator41{..}

instance ToJSON OtherOfferImageLocator41 where
  toJSON OtherOfferImageLocator41{..} =
    object [
      "media_location" .= mediaLocation
    ]
