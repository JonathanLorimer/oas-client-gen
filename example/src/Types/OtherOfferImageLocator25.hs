{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator25 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator25 = OtherOfferImageLocator25
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator25 where
  parseJSON = withObject "OtherOfferImageLocator25" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator25{..}

instance ToJSON OtherOfferImageLocator25 where
  toJSON OtherOfferImageLocator25{..} =
    object [
      "media_location" .= mediaLocation
    ]
