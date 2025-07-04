{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemLengthWidth where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Length5 (Length5)
import Types.Width6 (Width6)

data ItemLengthWidth = ItemLengthWidth
  { length :: Length5
  , width :: Width6
  }
  deriving (Show, Eq)

instance FromJSON ItemLengthWidth where
  parseJSON = withObject "ItemLengthWidth" $ \obj -> do
    length <- obj .: "length"
    width <- obj .: "width"
    pure $ ItemLengthWidth{..}

instance ToJSON ItemLengthWidth where
  toJSON ItemLengthWidth{..} =
    object [
      "length" .= length,
      "width" .= width
    ]
