{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator46 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator46 = OtherOfferImageLocator46
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator46 where
  parseJSON = withObject "OtherOfferImageLocator46" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator46{..}

instance ToJSON OtherOfferImageLocator46 where
  toJSON OtherOfferImageLocator46{..} =
    object [
      "media_location" .= mediaLocation
    ]
