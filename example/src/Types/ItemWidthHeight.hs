{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemWidthHeight where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height3 (Height3)
import Types.Width3 (Width3)

data ItemWidthHeight = ItemWidthHeight
  { height :: Height3
  , width :: Width3
  }
  deriving (Show, Eq)

instance FromJSON ItemWidthHeight where
  parseJSON = withObject "ItemWidthHeight" $ \obj -> do
    height <- obj .: "height"
    width <- obj .: "width"
    pure $ ItemWidthHeight{..}

instance ToJSON ItemWidthHeight where
  toJSON ItemWidthHeight{..} =
    object [
      "height" .= height,
      "width" .= width
    ]
