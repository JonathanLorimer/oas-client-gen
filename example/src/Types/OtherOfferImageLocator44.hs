{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator44 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator44 = OtherOfferImageLocator44
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator44 where
  parseJSON = withObject "OtherOfferImageLocator44" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator44{..}

instance ToJSON OtherOfferImageLocator44 where
  toJSON OtherOfferImageLocator44{..} =
    object [
      "media_location" .= mediaLocation
    ]
