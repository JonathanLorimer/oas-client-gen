{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductDetails6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ApparelSize (ApparelSize)
import Types.Capacity1 (Capacity1)
import Types.Closure (Closure)
import Types.CuffStyle1 (CuffStyle1)
import Types.Frame (Frame)
import Types.Height6 (Height6)
import Types.Height7 (Height7)
import Types.ItemLengthWidth (ItemLengthWidth)
import Types.ItemLengthWidthHeight (ItemLengthWidthHeight)
import Types.ItemWidthHeight1 (ItemWidthHeight1)
import Types.Length5 (Length5)
import Types.Length6 (Length6)
import Types.Material (Material)
import Types.Neck1 (Neck1)
import Types.NeckStyle1 (NeckStyle1)
import Types.ShirtSize1 (ShirtSize1)
import Types.Sleeve1 (Sleeve1)
import Types.Type3 (Type3)
import Types.Type4 (Type4)
import Types.Type5 (Type5)
import Types.Type6 (Type6)
import Types.UnitCount2 (UnitCount2)
import Types.Width6 (Width6)
import Types.Width7 (Width7)
import Types.Width8 (Width8)

data ProductDetails6 = ProductDetails6
  { ageRangeDescription :: Maybe Text
  , apparelSize :: ApparelSize
  , bulletPoint :: Text
  , capacity :: Capacity1
  , careInstructions :: Maybe Text
  , closure :: Closure
  , color :: Maybe Text
  , compatiblePhoneModels :: Text
  , department :: Maybe Text
  , fabricType :: Maybe Text
  , fitType :: Maybe Text
  , formFactor :: Text
  , frame :: [Frame]
  , includedComponents :: Text
  , isAssemblyRequired :: Text
  , isExpirationDatedProduct :: Text
  , isFramed :: Text
  , itemLengthWidth :: ItemLengthWidth
  , itemLengthWidthHeight :: ItemLengthWidthHeight
  , itemShape :: Text
  , itemTypeName :: Text
  , itemWidthHeight :: ItemWidthHeight1
  , liningDescription :: Text
  , material :: Text
  , neck :: Neck1
  , numberOfCompartments :: Int
  , numberOfItems :: Int
  , numberOfPieces :: Int
  , numberOfPockets :: Int
  , occasionType :: Text
  , orientation :: Text
  , partNumber :: Text
  , pattern :: Text
  , productDescription :: Text
  , shirtSize :: ShirtSize1
  , size :: Text
  , sizeInfo :: Text
  , sleeve :: Sleeve1
  , specialFeature :: Text
  , specialSizeType :: Text
  , strapType :: Text
  , style :: Maybe Text
  , targetGender :: Maybe Text
  , theme :: Text
  , unitCount :: UnitCount2
  , wallArtForm :: Text
  }
  deriving (Show, Eq)

instance FromJSON ProductDetails6 where
  parseJSON = withObject "ProductDetails6" $ \obj -> do
    ageRangeDescription <- obj .: "age_range_description"
    apparelSize <- obj .: "apparel_size"
    bulletPoint <- obj .: "bullet_point"
    capacity <- obj .: "capacity"
    careInstructions <- obj .: "care_instructions"
    closure <- obj .: "closure"
    color <- obj .: "color"
    compatiblePhoneModels <- obj .: "compatible_phone_models"
    department <- obj .: "department"
    fabricType <- obj .: "fabric_type"
    fitType <- obj .: "fit_type"
    formFactor <- obj .: "form_factor"
    frame <- obj .: "frame"
    includedComponents <- obj .: "included_components"
    isAssemblyRequired <- obj .: "is_assembly_required"
    isExpirationDatedProduct <- obj .: "is_expiration_dated_product"
    isFramed <- obj .: "is_framed"
    itemLengthWidth <- obj .: "item_length_width"
    itemLengthWidthHeight <- obj .: "item_length_width_height"
    itemShape <- obj .: "item_shape"
    itemTypeName <- obj .: "item_type_name"
    itemWidthHeight <- obj .: "item_width_height"
    liningDescription <- obj .: "lining_description"
    material <- obj .: "material"
    neck <- obj .: "neck"
    numberOfCompartments <- obj .: "number_of_compartments"
    numberOfItems <- obj .: "number_of_items"
    numberOfPieces <- obj .: "number_of_pieces"
    numberOfPockets <- obj .: "number_of_pockets"
    occasionType <- obj .: "occasion_type"
    orientation <- obj .: "orientation"
    partNumber <- obj .: "part_number"
    pattern <- obj .: "pattern"
    productDescription <- obj .: "product_description"
    shirtSize <- obj .: "shirt_size"
    size <- obj .: "size"
    sizeInfo <- obj .: "size_info"
    sleeve <- obj .: "sleeve"
    specialFeature <- obj .: "special_feature"
    specialSizeType <- obj .: "special_size_type"
    strapType <- obj .: "strap_type"
    style <- obj .: "style"
    targetGender <- obj .: "target_gender"
    theme <- obj .: "theme"
    unitCount <- obj .: "unit_count"
    wallArtForm <- obj .: "wall_art_form"
    pure $ ProductDetails6{..}

instance ToJSON ProductDetails6 where
  toJSON ProductDetails6{..} =
    object [
      "age_range_description" .= ageRangeDescription,
      "apparel_size" .= apparelSize,
      "bullet_point" .= bulletPoint,
      "capacity" .= capacity,
      "care_instructions" .= careInstructions,
      "closure" .= closure,
      "color" .= color,
      "compatible_phone_models" .= compatiblePhoneModels,
      "department" .= department,
      "fabric_type" .= fabricType,
      "fit_type" .= fitType,
      "form_factor" .= formFactor,
      "frame" .= frame,
      "included_components" .= includedComponents,
      "is_assembly_required" .= isAssemblyRequired,
      "is_expiration_dated_product" .= isExpirationDatedProduct,
      "is_framed" .= isFramed,
      "item_length_width" .= itemLengthWidth,
      "item_length_width_height" .= itemLengthWidthHeight,
      "item_shape" .= itemShape,
      "item_type_name" .= itemTypeName,
      "item_width_height" .= itemWidthHeight,
      "lining_description" .= liningDescription,
      "material" .= material,
      "neck" .= neck,
      "number_of_compartments" .= numberOfCompartments,
      "number_of_items" .= numberOfItems,
      "number_of_pieces" .= numberOfPieces,
      "number_of_pockets" .= numberOfPockets,
      "occasion_type" .= occasionType,
      "orientation" .= orientation,
      "part_number" .= partNumber,
      "pattern" .= pattern,
      "product_description" .= productDescription,
      "shirt_size" .= shirtSize,
      "size" .= size,
      "size_info" .= sizeInfo,
      "sleeve" .= sleeve,
      "special_feature" .= specialFeature,
      "special_size_type" .= specialSizeType,
      "strap_type" .= strapType,
      "style" .= style,
      "target_gender" .= targetGender,
      "theme" .= theme,
      "unit_count" .= unitCount,
      "wall_art_form" .= wallArtForm
    ]
