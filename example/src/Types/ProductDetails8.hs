{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductDetails8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Frame1 (Frame1)
import Types.ItemLengthWidth1 (ItemLengthWidth1)
import Types.Length10 (Length10)
import Types.Material1 (Material1)
import Types.Type8 (Type8)
import Types.Width12 (Width12)

data ProductDetails8 = ProductDetails8
  { bulletPoint :: Text
  , color :: Maybe Text
  , frame :: [Frame1]
  , isFramed :: Text
  , itemLengthWidth :: ItemLengthWidth1
  , itemShape :: Text
  , numberOfItems :: Int
  , orientation :: Text
  , productDescription :: Text
  , size :: Text
  , theme :: Text
  , wallArtForm :: Text
  }
  deriving (Show, Eq)

instance FromJSON ProductDetails8 where
  parseJSON = withObject "ProductDetails8" $ \obj -> do
    bulletPoint <- obj .: "bullet_point"
    color <- obj .: "color"
    frame <- obj .: "frame"
    isFramed <- obj .: "is_framed"
    itemLengthWidth <- obj .: "item_length_width"
    itemShape <- obj .: "item_shape"
    numberOfItems <- obj .: "number_of_items"
    orientation <- obj .: "orientation"
    productDescription <- obj .: "product_description"
    size <- obj .: "size"
    theme <- obj .: "theme"
    wallArtForm <- obj .: "wall_art_form"
    pure $ ProductDetails8{..}

instance ToJSON ProductDetails8 where
  toJSON ProductDetails8{..} =
    object [
      "bullet_point" .= bulletPoint,
      "color" .= color,
      "frame" .= frame,
      "is_framed" .= isFramed,
      "item_length_width" .= itemLengthWidth,
      "item_shape" .= itemShape,
      "number_of_items" .= numberOfItems,
      "orientation" .= orientation,
      "product_description" .= productDescription,
      "size" .= size,
      "theme" .= theme,
      "wall_art_form" .= wallArtForm
    ]
