{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductDetails3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Capacity (Capacity)
import Types.Height3 (Height3)
import Types.ItemWidthHeight (ItemWidthHeight)
import Types.Type1 (Type1)
import Types.UnitCount1 (UnitCount1)
import Types.Width3 (Width3)

data ProductDetails3 = ProductDetails3
  { bulletPoint :: Text
  , capacity :: Capacity
  , careInstructions :: Maybe Text
  , color :: Maybe Text
  , includedComponents :: Text
  , itemTypeName :: Text
  , itemWidthHeight :: ItemWidthHeight
  , material :: Text
  , numberOfItems :: Int
  , numberOfPieces :: Int
  , occasionType :: Text
  , productDescription :: Text
  , size :: Text
  , specialFeature :: Text
  , style :: Maybe Text
  , unitCount :: UnitCount1
  }
  deriving (Show, Eq)

instance FromJSON ProductDetails3 where
  parseJSON = withObject "ProductDetails3" $ \obj -> do
    bulletPoint <- obj .: "bullet_point"
    capacity <- obj .: "capacity"
    careInstructions <- obj .: "care_instructions"
    color <- obj .: "color"
    includedComponents <- obj .: "included_components"
    itemTypeName <- obj .: "item_type_name"
    itemWidthHeight <- obj .: "item_width_height"
    material <- obj .: "material"
    numberOfItems <- obj .: "number_of_items"
    numberOfPieces <- obj .: "number_of_pieces"
    occasionType <- obj .: "occasion_type"
    productDescription <- obj .: "product_description"
    size <- obj .: "size"
    specialFeature <- obj .: "special_feature"
    style <- obj .: "style"
    unitCount <- obj .: "unit_count"
    pure $ ProductDetails3{..}

instance ToJSON ProductDetails3 where
  toJSON ProductDetails3{..} =
    object [
      "bullet_point" .= bulletPoint,
      "capacity" .= capacity,
      "care_instructions" .= careInstructions,
      "color" .= color,
      "included_components" .= includedComponents,
      "item_type_name" .= itemTypeName,
      "item_width_height" .= itemWidthHeight,
      "material" .= material,
      "number_of_items" .= numberOfItems,
      "number_of_pieces" .= numberOfPieces,
      "occasion_type" .= occasionType,
      "product_description" .= productDescription,
      "size" .= size,
      "special_feature" .= specialFeature,
      "style" .= style,
      "unit_count" .= unitCount
    ]
