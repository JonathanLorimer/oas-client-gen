{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemPackageDimensions3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height4 (Height4)
import Types.Length3 (Length3)
import Types.Width4 (Width4)

data ItemPackageDimensions3 = ItemPackageDimensions3
  { height :: Height4
  , length :: Length3
  , width :: Width4
  }
  deriving (Show, Eq)

instance FromJSON ItemPackageDimensions3 where
  parseJSON = withObject "ItemPackageDimensions3" $ \obj -> do
    height <- obj .: "height"
    length <- obj .: "length"
    width <- obj .: "width"
    pure $ ItemPackageDimensions3{..}

instance ToJSON ItemPackageDimensions3 where
  toJSON ItemPackageDimensions3{..} =
    object [
      "height" .= height,
      "length" .= length,
      "width" .= width
    ]
