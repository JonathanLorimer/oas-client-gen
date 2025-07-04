{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemPackageDimensions2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height2 (Height2)
import Types.Length2 (Length2)
import Types.Width2 (Width2)

data ItemPackageDimensions2 = ItemPackageDimensions2
  { height :: Height2
  , length :: Length2
  , width :: Width2
  }
  deriving (Show, Eq)

instance FromJSON ItemPackageDimensions2 where
  parseJSON = withObject "ItemPackageDimensions2" $ \obj -> do
    height <- obj .: "height"
    length <- obj .: "length"
    width <- obj .: "width"
    pure $ ItemPackageDimensions2{..}

instance ToJSON ItemPackageDimensions2 where
  toJSON ItemPackageDimensions2{..} =
    object [
      "height" .= height,
      "length" .= length,
      "width" .= width
    ]
