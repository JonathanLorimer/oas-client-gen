{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemLengthWidthHeight1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height9 (Height9)
import Types.Length8 (Length8)
import Types.Width10 (Width10)

data ItemLengthWidthHeight1 = ItemLengthWidthHeight1
  { height :: Height9
  , length :: Length8
  , width :: Width10
  }
  deriving (Show, Eq)

instance FromJSON ItemLengthWidthHeight1 where
  parseJSON = withObject "ItemLengthWidthHeight1" $ \obj -> do
    height <- obj .: "height"
    length <- obj .: "length"
    width <- obj .: "width"
    pure $ ItemLengthWidthHeight1{..}

instance ToJSON ItemLengthWidthHeight1 where
  toJSON ItemLengthWidthHeight1{..} =
    object [
      "height" .= height,
      "length" .= length,
      "width" .= width
    ]
