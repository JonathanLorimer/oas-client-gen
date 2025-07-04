{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator57 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator57 = OtherOfferImageLocator57
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator57 where
  parseJSON = withObject "OtherOfferImageLocator57" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator57{..}

instance ToJSON OtherOfferImageLocator57 where
  toJSON OtherOfferImageLocator57{..} =
    object [
      "media_location" .= mediaLocation
    ]
