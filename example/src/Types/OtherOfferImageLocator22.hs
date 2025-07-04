{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator22 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator22 = OtherOfferImageLocator22
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator22 where
  parseJSON = withObject "OtherOfferImageLocator22" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator22{..}

instance ToJSON OtherOfferImageLocator22 where
  toJSON OtherOfferImageLocator22{..} =
    object [
      "media_location" .= mediaLocation
    ]
