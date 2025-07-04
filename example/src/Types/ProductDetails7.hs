{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductDetails7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Capacity2 (Capacity2)
import Types.Closure1 (Closure1)
import Types.Height9 (Height9)
import Types.ItemLengthWidthHeight1 (ItemLengthWidthHeight1)
import Types.Length8 (Length8)
import Types.Type7 (Type7)
import Types.Width10 (Width10)

data ProductDetails7 = ProductDetails7
  { ageRangeDescription :: Maybe Text
  , bulletPoint :: Text
  , capacity :: Capacity2
  , closure :: Closure1
  , color :: Maybe Text
  , department :: Maybe Text
  , fabricType :: Maybe Text
  , itemLengthWidthHeight :: ItemLengthWidthHeight1
  , itemTypeName :: Text
  , liningDescription :: Text
  , material :: Text
  , numberOfCompartments :: Int
  , numberOfItems :: Int
  , numberOfPockets :: Int
  , productDescription :: Text
  , size :: Text
  , sizeInfo :: Text
  , specialFeature :: Text
  , strapType :: Text
  , style :: Maybe Text
  , targetGender :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ProductDetails7 where
  parseJSON = withObject "ProductDetails7" $ \obj -> do
    ageRangeDescription <- obj .: "age_range_description"
    bulletPoint <- obj .: "bullet_point"
    capacity <- obj .: "capacity"
    closure <- obj .: "closure"
    color <- obj .: "color"
    department <- obj .: "department"
    fabricType <- obj .: "fabric_type"
    itemLengthWidthHeight <- obj .: "item_length_width_height"
    itemTypeName <- obj .: "item_type_name"
    liningDescription <- obj .: "lining_description"
    material <- obj .: "material"
    numberOfCompartments <- obj .: "number_of_compartments"
    numberOfItems <- obj .: "number_of_items"
    numberOfPockets <- obj .: "number_of_pockets"
    productDescription <- obj .: "product_description"
    size <- obj .: "size"
    sizeInfo <- obj .: "size_info"
    specialFeature <- obj .: "special_feature"
    strapType <- obj .: "strap_type"
    style <- obj .: "style"
    targetGender <- obj .: "target_gender"
    pure $ ProductDetails7{..}

instance ToJSON ProductDetails7 where
  toJSON ProductDetails7{..} =
    object [
      "age_range_description" .= ageRangeDescription,
      "bullet_point" .= bulletPoint,
      "capacity" .= capacity,
      "closure" .= closure,
      "color" .= color,
      "department" .= department,
      "fabric_type" .= fabricType,
      "item_length_width_height" .= itemLengthWidthHeight,
      "item_type_name" .= itemTypeName,
      "lining_description" .= liningDescription,
      "material" .= material,
      "number_of_compartments" .= numberOfCompartments,
      "number_of_items" .= numberOfItems,
      "number_of_pockets" .= numberOfPockets,
      "product_description" .= productDescription,
      "size" .= size,
      "size_info" .= sizeInfo,
      "special_feature" .= specialFeature,
      "strap_type" .= strapType,
      "style" .= style,
      "target_gender" .= targetGender
    ]
