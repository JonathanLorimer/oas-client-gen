{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator12 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator12 = OtherOfferImageLocator12
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator12 where
  parseJSON = withObject "OtherOfferImageLocator12" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator12{..}

instance ToJSON OtherOfferImageLocator12 where
  toJSON OtherOfferImageLocator12{..} =
    object [
      "media_location" .= mediaLocation
    ]
