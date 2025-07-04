{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemPackageDimensions1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height1 (Height1)
import Types.Length1 (Length1)
import Types.Width1 (Width1)

data ItemPackageDimensions1 = ItemPackageDimensions1
  { height :: Height1
  , length :: Length1
  , width :: Width1
  }
  deriving (Show, Eq)

instance FromJSON ItemPackageDimensions1 where
  parseJSON = withObject "ItemPackageDimensions1" $ \obj -> do
    height <- obj .: "height"
    length <- obj .: "length"
    width <- obj .: "width"
    pure $ ItemPackageDimensions1{..}

instance ToJSON ItemPackageDimensions1 where
  toJSON ItemPackageDimensions1{..} =
    object [
      "height" .= height,
      "length" .= length,
      "width" .= width
    ]
