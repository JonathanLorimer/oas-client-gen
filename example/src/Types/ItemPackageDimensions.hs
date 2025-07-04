{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemPackageDimensions where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height (Height)
import Types.Length (Length)
import Types.Width (Width)

data ItemPackageDimensions = ItemPackageDimensions
  { height :: Height
  , length :: Length
  , width :: Width
  }
  deriving (Show, Eq)

instance FromJSON ItemPackageDimensions where
  parseJSON = withObject "ItemPackageDimensions" $ \obj -> do
    height <- obj .: "height"
    length <- obj .: "length"
    width <- obj .: "width"
    pure $ ItemPackageDimensions{..}

instance ToJSON ItemPackageDimensions where
  toJSON ItemPackageDimensions{..} =
    object [
      "height" .= height,
      "length" .= length,
      "width" .= width
    ]
