{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.NeckStyle where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data NeckStyle = NeckStyle
  { value :: Text
  }
  deriving (Show, Eq)

instance FromJSON NeckStyle where
  parseJSON = withObject "NeckStyle" $ \obj -> do
    value <- obj .: "value"
    pure $ NeckStyle{..}

instance ToJSON NeckStyle where
  toJSON NeckStyle{..} =
    object [
      "value" .= value
    ]
