{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator1 = OtherOfferImageLocator1
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator1 where
  parseJSON = withObject "OtherOfferImageLocator1" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator1{..}

instance ToJSON OtherOfferImageLocator1 where
  toJSON OtherOfferImageLocator1{..} =
    object [
      "media_location" .= mediaLocation
    ]
