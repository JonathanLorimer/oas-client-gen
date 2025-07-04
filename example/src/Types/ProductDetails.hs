{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductDetails where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ProductDetails = ProductDetails
  { bulletPoint :: Text
  , color :: Maybe Text
  , compatiblePhoneModels :: Text
  , formFactor :: Text
  , includedComponents :: Text
  , material :: Text
  , numberOfItems :: Int
  , partNumber :: Text
  , pattern :: Text
  , productDescription :: Text
  , specialFeature :: Text
  , theme :: Text
  }
  deriving (Show, Eq)

instance FromJSON ProductDetails where
  parseJSON = withObject "ProductDetails" $ \obj -> do
    bulletPoint <- obj .: "bullet_point"
    color <- obj .: "color"
    compatiblePhoneModels <- obj .: "compatible_phone_models"
    formFactor <- obj .: "form_factor"
    includedComponents <- obj .: "included_components"
    material <- obj .: "material"
    numberOfItems <- obj .: "number_of_items"
    partNumber <- obj .: "part_number"
    pattern <- obj .: "pattern"
    productDescription <- obj .: "product_description"
    specialFeature <- obj .: "special_feature"
    theme <- obj .: "theme"
    pure $ ProductDetails{..}

instance ToJSON ProductDetails where
  toJSON ProductDetails{..} =
    object [
      "bullet_point" .= bulletPoint,
      "color" .= color,
      "compatible_phone_models" .= compatiblePhoneModels,
      "form_factor" .= formFactor,
      "included_components" .= includedComponents,
      "material" .= material,
      "number_of_items" .= numberOfItems,
      "part_number" .= partNumber,
      "pattern" .= pattern,
      "product_description" .= productDescription,
      "special_feature" .= specialFeature,
      "theme" .= theme
    ]
