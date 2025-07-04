{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherOfferImageLocator24 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherOfferImageLocator24 = OtherOfferImageLocator24
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherOfferImageLocator24 where
  parseJSON = withObject "OtherOfferImageLocator24" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherOfferImageLocator24{..}

instance ToJSON OtherOfferImageLocator24 where
  toJSON OtherOfferImageLocator24{..} =
    object [
      "media_location" .= mediaLocation
    ]
