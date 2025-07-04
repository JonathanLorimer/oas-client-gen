{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemPackageDimensions7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height11 (Height11)
import Types.Length11 (Length11)
import Types.Width13 (Width13)

data ItemPackageDimensions7 = ItemPackageDimensions7
  { height :: Height11
  , length :: Length11
  , width :: Width13
  }
  deriving (Show, Eq)

instance FromJSON ItemPackageDimensions7 where
  parseJSON = withObject "ItemPackageDimensions7" $ \obj -> do
    height <- obj .: "height"
    length <- obj .: "length"
    width <- obj .: "width"
    pure $ ItemPackageDimensions7{..}

instance ToJSON ItemPackageDimensions7 where
  toJSON ItemPackageDimensions7{..} =
    object [
      "height" .= height,
      "length" .= length,
      "width" .= width
    ]
