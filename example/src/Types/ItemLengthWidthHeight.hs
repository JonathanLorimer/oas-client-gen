{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemLengthWidthHeight where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height6 (Height6)
import Types.Length6 (Length6)
import Types.Width7 (Width7)

data ItemLengthWidthHeight = ItemLengthWidthHeight
  { height :: Height6
  , length :: Length6
  , width :: Width7
  }
  deriving (Show, Eq)

instance FromJSON ItemLengthWidthHeight where
  parseJSON = withObject "ItemLengthWidthHeight" $ \obj -> do
    height <- obj .: "height"
    length <- obj .: "length"
    width <- obj .: "width"
    pure $ ItemLengthWidthHeight{..}

instance ToJSON ItemLengthWidthHeight where
  toJSON ItemLengthWidthHeight{..} =
    object [
      "height" .= height,
      "length" .= length,
      "width" .= width
    ]
