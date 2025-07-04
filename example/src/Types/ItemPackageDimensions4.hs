{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemPackageDimensions4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height5 (Height5)
import Types.Length4 (Length4)
import Types.Width5 (Width5)

data ItemPackageDimensions4 = ItemPackageDimensions4
  { height :: Height5
  , length :: Length4
  , width :: Width5
  }
  deriving (Show, Eq)

instance FromJSON ItemPackageDimensions4 where
  parseJSON = withObject "ItemPackageDimensions4" $ \obj -> do
    height <- obj .: "height"
    length <- obj .: "length"
    width <- obj .: "width"
    pure $ ItemPackageDimensions4{..}

instance ToJSON ItemPackageDimensions4 where
  toJSON ItemPackageDimensions4{..} =
    object [
      "height" .= height,
      "length" .= length,
      "width" .= width
    ]
