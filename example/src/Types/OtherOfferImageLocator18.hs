{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator18 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator18 = OtherOfferImageLocator18
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator18 where
  parseJSON = withObject "OtherOfferImageLocator18" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator18{..}

instance ToJSON OtherOfferImageLocator18 where
  toJSON OtherOfferImageLocator18{..} =
    object [
      "media_location" .= mediaLocation
    ]
