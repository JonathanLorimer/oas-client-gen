{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductDetails1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ProductDetails1 = ProductDetails1
  { bulletPoint :: Text
  , color :: Maybe Text
  , fabricType :: Maybe Text
  , itemShape :: Text
  , itemTypeName :: Text
  , material :: Text
  , numberOfItems :: Int
  , partNumber :: Text
  , productDescription :: Text
  }
  deriving (Show, Eq)

instance FromJSON ProductDetails1 where
  parseJSON = withObject "ProductDetails1" $ \obj -> do
    bulletPoint <- obj .: "bullet_point"
    color <- obj .: "color"
    fabricType <- obj .: "fabric_type"
    itemShape <- obj .: "item_shape"
    itemTypeName <- obj .: "item_type_name"
    material <- obj .: "material"
    numberOfItems <- obj .: "number_of_items"
    partNumber <- obj .: "part_number"
    productDescription <- obj .: "product_description"
    pure $ ProductDetails1{..}

instance ToJSON ProductDetails1 where
  toJSON ProductDetails1{..} =
    object [
      "bullet_point" .= bulletPoint,
      "color" .= color,
      "fabric_type" .= fabricType,
      "item_shape" .= itemShape,
      "item_type_name" .= itemTypeName,
      "material" .= material,
      "number_of_items" .= numberOfItems,
      "part_number" .= partNumber,
      "product_description" .= productDescription
    ]
