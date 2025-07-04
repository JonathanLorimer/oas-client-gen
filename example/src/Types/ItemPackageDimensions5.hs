{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemPackageDimensions5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height8 (Height8)
import Types.Length7 (Length7)
import Types.Width9 (Width9)

data ItemPackageDimensions5 = ItemPackageDimensions5
  { height :: Height8
  , length :: Length7
  , width :: Width9
  }
  deriving (Show, Eq)

instance FromJSON ItemPackageDimensions5 where
  parseJSON = withObject "ItemPackageDimensions5" $ \obj -> do
    height <- obj .: "height"
    length <- obj .: "length"
    width <- obj .: "width"
    pure $ ItemPackageDimensions5{..}

instance ToJSON ItemPackageDimensions5 where
  toJSON ItemPackageDimensions5{..} =
    object [
      "height" .= height,
      "length" .= length,
      "width" .= width
    ]
