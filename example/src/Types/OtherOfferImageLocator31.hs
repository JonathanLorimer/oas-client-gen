{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator31 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator31 = OtherOfferImageLocator31
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator31 where
  parseJSON = withObject "OtherOfferImageLocator31" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator31{..}

instance ToJSON OtherOfferImageLocator31 where
  toJSON OtherOfferImageLocator31{..} =
    object [
      "media_location" .= mediaLocation
    ]
