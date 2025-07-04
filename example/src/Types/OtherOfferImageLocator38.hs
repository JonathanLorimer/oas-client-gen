{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator38 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator38 = OtherOfferImageLocator38
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator38 where
  parseJSON = withObject "OtherOfferImageLocator38" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator38{..}

instance ToJSON OtherOfferImageLocator38 where
  toJSON OtherOfferImageLocator38{..} =
    object [
      "media_location" .= mediaLocation
    ]
