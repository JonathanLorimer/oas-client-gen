{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemWidthHeight1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height7 (Height7)
import Types.Width8 (Width8)

data ItemWidthHeight1 = ItemWidthHeight1
  { height :: Height7
  , width :: Width8
  }
  deriving (Show, Eq)

instance FromJSON ItemWidthHeight1 where
  parseJSON = withObject "ItemWidthHeight1" $ \obj -> do
    height <- obj .: "height"
    width <- obj .: "width"
    pure $ ItemWidthHeight1{..}

instance ToJSON ItemWidthHeight1 where
  toJSON ItemWidthHeight1{..} =
    object [
      "height" .= height,
      "width" .= width
    ]
