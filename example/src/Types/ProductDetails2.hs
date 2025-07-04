{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductDetails2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Type (Type)
import Types.UnitCount (UnitCount)

data ProductDetails2 = ProductDetails2
  { bulletPoint :: Text
  , includedComponents :: Text
  , itemTypeName :: Text
  , numberOfItems :: Int
  , productDescription :: Text
  , unitCount :: UnitCount
  }
  deriving (Show, Eq)

instance FromJSON ProductDetails2 where
  parseJSON = withObject "ProductDetails2" $ \obj -> do
    bulletPoint <- obj .: "bullet_point"
    includedComponents <- obj .: "included_components"
    itemTypeName <- obj .: "item_type_name"
    numberOfItems <- obj .: "number_of_items"
    productDescription <- obj .: "product_description"
    unitCount <- obj .: "unit_count"
    pure $ ProductDetails2{..}

instance ToJSON ProductDetails2 where
  toJSON ProductDetails2{..} =
    object [
      "bullet_point" .= bulletPoint,
      "included_components" .= includedComponents,
      "item_type_name" .= itemTypeName,
      "number_of_items" .= numberOfItems,
      "product_description" .= productDescription,
      "unit_count" .= unitCount
    ]
