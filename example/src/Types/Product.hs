{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Product where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.CurrencyPrices (CurrencyPrices)
import Types.Images (Images)
import Types.Images1 (Images1)
import Types.Inventory (Inventory)
import Types.LinkedProducts (LinkedProducts)
import Types.Locations (Locations)
import Types.OptionValues (OptionValues)
import Types.Variants1 (Variants1)
import Types.Weight (Weight)
import Types.Status_1 (Status_1)

data Product = Product
  { categoryId :: Maybe Text
  , createdAt :: Text
  , description :: Text
  , id :: Text
  , images :: [Images]
  , name :: Text
  , platformData :: Map Text Value
  , platformId :: Text
  , productUrl :: Text
  , status :: Status_1
  , tags :: [Maybe Text]
  , type_ :: Text
  , updatedAt :: Text
  , variants :: [Variants1]
  }
  deriving (Show, Eq)

instance FromJSON Product where
  parseJSON = withObject "Product" $ \obj -> do
    categoryId <- obj .: "category_id"
    createdAt <- obj .: "created_at"
    description <- obj .: "description"
    id <- obj .: "id"
    images <- obj .: "images"
    name <- obj .: "name"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    productUrl <- obj .: "product_url"
    status <- obj .: "status"
    tags <- obj .: "tags"
    type_ <- obj .: "type"
    updatedAt <- obj .: "updated_at"
    variants <- obj .: "variants"
    pure $ Product{..}

instance ToJSON Product where
  toJSON Product{..} =
    object [
      "category_id" .= categoryId,
      "created_at" .= createdAt,
      "description" .= description,
      "id" .= id,
      "images" .= images,
      "name" .= name,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "product_url" .= productUrl,
      "status" .= status,
      "tags" .= tags,
      "type" .= type_,
      "updated_at" .= updatedAt,
      "variants" .= variants
    ]
