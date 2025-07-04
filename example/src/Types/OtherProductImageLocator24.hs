{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OtherProductImageLocator24 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OtherProductImageLocator24 = OtherProductImageLocator24
  { mediaLocation :: Text
  }
  deriving (Show, Eq)

instance FromJSON OtherProductImageLocator24 where
  parseJSON = withObject "OtherProductImageLocator24" $ \obj -> do
    mediaLocation <- obj .: "media_location"
    pure $ OtherProductImageLocator24{..}

instance ToJSON OtherProductImageLocator24 where
  toJSON OtherProductImageLocator24{..} =
    object [
      "media_location" .= mediaLocation
    ]
