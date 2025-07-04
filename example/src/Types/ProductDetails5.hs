{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductDetails5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.CuffStyle (CuffStyle)
import Types.Neck (Neck)
import Types.NeckStyle (NeckStyle)
import Types.ShirtSize (ShirtSize)
import Types.Sleeve (Sleeve)
import Types.Type2 (Type2)

data ProductDetails5 = ProductDetails5
  { ageRangeDescription :: Maybe Text
  , bulletPoint :: Text
  , careInstructions :: Maybe Text
  , color :: Maybe Text
  , department :: Maybe Text
  , fabricType :: Maybe Text
  , fitType :: Maybe Text
  , itemTypeName :: Text
  , material :: Text
  , neck :: Neck
  , productDescription :: Text
  , shirtSize :: ShirtSize
  , size :: Text
  , sleeve :: Sleeve
  , specialSizeType :: Text
  , style :: Maybe Text
  , targetGender :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ProductDetails5 where
  parseJSON = withObject "ProductDetails5" $ \obj -> do
    ageRangeDescription <- obj .: "age_range_description"
    bulletPoint <- obj .: "bullet_point"
    careInstructions <- obj .: "care_instructions"
    color <- obj .: "color"
    department <- obj .: "department"
    fabricType <- obj .: "fabric_type"
    fitType <- obj .: "fit_type"
    itemTypeName <- obj .: "item_type_name"
    material <- obj .: "material"
    neck <- obj .: "neck"
    productDescription <- obj .: "product_description"
    shirtSize <- obj .: "shirt_size"
    size <- obj .: "size"
    sleeve <- obj .: "sleeve"
    specialSizeType <- obj .: "special_size_type"
    style <- obj .: "style"
    targetGender <- obj .: "target_gender"
    pure $ ProductDetails5{..}

instance ToJSON ProductDetails5 where
  toJSON ProductDetails5{..} =
    object [
      "age_range_description" .= ageRangeDescription,
      "bullet_point" .= bulletPoint,
      "care_instructions" .= careInstructions,
      "color" .= color,
      "department" .= department,
      "fabric_type" .= fabricType,
      "fit_type" .= fitType,
      "item_type_name" .= itemTypeName,
      "material" .= material,
      "neck" .= neck,
      "product_description" .= productDescription,
      "shirt_size" .= shirtSize,
      "size" .= size,
      "sleeve" .= sleeve,
      "special_size_type" .= specialSizeType,
      "style" .= style,
      "target_gender" .= targetGender
    ]
