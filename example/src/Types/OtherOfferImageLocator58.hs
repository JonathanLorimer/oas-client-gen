{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator58 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator58 = OtherOfferImageLocator58
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator58 where
  parseJSON = withObject "OtherOfferImageLocator58" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator58{..}

instance ToJSON OtherOfferImageLocator58 where
  toJSON OtherOfferImageLocator58{..} =
    object [
      "media_location" .= mediaLocation
    ]
