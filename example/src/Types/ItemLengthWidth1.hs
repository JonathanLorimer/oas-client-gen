{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemLengthWidth1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Length10 (Length10)
import Types.Width12 (Width12)

data ItemLengthWidth1 = ItemLengthWidth1
  { length :: Length10
  , width :: Width12
  }
  deriving (Show, Eq)

instance FromJSON ItemLengthWidth1 where
  parseJSON = withObject "ItemLengthWidth1" $ \obj -> do
    length <- obj .: "length"
    width <- obj .: "width"
    pure $ ItemLengthWidth1{..}

instance ToJSON ItemLengthWidth1 where
  toJSON ItemLengthWidth1{..} =
    object [
      "length" .= length,
      "width" .= width
    ]
