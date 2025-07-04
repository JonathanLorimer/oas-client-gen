{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator37 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator37 = OtherOfferImageLocator37
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator37 where
  parseJSON = withObject "OtherOfferImageLocator37" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator37{..}

instance ToJSON OtherOfferImageLocator37 where
  toJSON OtherOfferImageLocator37{..} =
    object [
      "media_location" .= mediaLocation
    ]
