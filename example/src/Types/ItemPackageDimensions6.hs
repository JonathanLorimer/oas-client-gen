{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemPackageDimensions6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height10 (Height10)
import Types.Length9 (Length9)
import Types.Width11 (Width11)

data ItemPackageDimensions6 = ItemPackageDimensions6
  { height :: Height10
  , length :: Length9
  , width :: Width11
  }
  deriving (Show, Eq)

instance FromJSON ItemPackageDimensions6 where
  parseJSON = withObject "ItemPackageDimensions6" $ \obj -> do
    height <- obj .: "height"
    length <- obj .: "length"
    width <- obj .: "width"
    pure $ ItemPackageDimensions6{..}

instance ToJSON ItemPackageDimensions6 where
  toJSON ItemPackageDimensions6{..} =
    object [
      "height" .= height,
      "length" .= length,
      "width" .= width
    ]
