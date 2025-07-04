{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Variants1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.CurrencyPrices (CurrencyPrices)
import Types.Images1 (Images1)
import Types.Inventory (Inventory)
import Types.LinkedProducts (LinkedProducts)
import Types.Locations (Locations)
import Types.OptionValues (OptionValues)
import Types.Weight (Weight)

data Variants1 = Variants1
  { barcode :: Maybe Text
  , createdAt :: Maybe Text
  , currencyPrices :: [CurrencyPrices]
  , description :: Maybe Text
  , fulfillmentService :: Maybe Text
  , id :: Text
  , images :: [Images1]
  , inventory :: Maybe Inventory
  , inventoryManagement :: Maybe Text
  , isoCurrencyCode :: Maybe Text
  , linkedProducts :: [LinkedProducts]
  , optionValues :: [OptionValues]
  , platformData :: Map Text Value
  , platformId :: Text
  , price :: Double
  , productId :: Text
  , requiresShipping :: Bool
  , shortDescription :: Maybe Text
  , sku :: Maybe Text
  , title :: Maybe Text
  , unitCost :: Maybe Double
  , updatedAt :: Maybe Text
  , variantUrl :: Text
  , weight :: Maybe Weight
  }
  deriving (Show, Eq)

instance FromJSON Variants1 where
  parseJSON = withObject "Variants1" $ \obj -> do
    barcode <- obj .: "barcode"
    createdAt <- obj .: "created_at"
    currencyPrices <- obj .: "currency_prices"
    description <- obj .: "description"
    fulfillmentService <- obj .: "fulfillment_service"
    id <- obj .: "id"
    images <- obj .: "images"
    inventory <- obj .: "inventory"
    inventoryManagement <- obj .: "inventory_management"
    isoCurrencyCode <- obj .: "iso_currency_code"
    linkedProducts <- obj .: "linked_products"
    optionValues <- obj .: "option_values"
    platformData <- obj .: "platform_data"
    platformId <- obj .: "platform_id"
    price <- obj .: "price"
    productId <- obj .: "product_id"
    requiresShipping <- obj .: "requires_shipping"
    shortDescription <- obj .: "short_description"
    sku <- obj .: "sku"
    title <- obj .: "title"
    unitCost <- obj .: "unit_cost"
    updatedAt <- obj .: "updated_at"
    variantUrl <- obj .: "variant_url"
    weight <- obj .: "weight"
    pure $ Variants1{..}

instance ToJSON Variants1 where
  toJSON Variants1{..} =
    object [
      "barcode" .= barcode,
      "created_at" .= createdAt,
      "currency_prices" .= currencyPrices,
      "description" .= description,
      "fulfillment_service" .= fulfillmentService,
      "id" .= id,
      "images" .= images,
      "inventory" .= inventory,
      "inventory_management" .= inventoryManagement,
      "iso_currency_code" .= isoCurrencyCode,
      "linked_products" .= linkedProducts,
      "option_values" .= optionValues,
      "platform_data" .= platformData,
      "platform_id" .= platformId,
      "price" .= price,
      "product_id" .= productId,
      "requires_shipping" .= requiresShipping,
      "short_description" .= shortDescription,
      "sku" .= sku,
      "title" .= title,
      "unit_cost" .= unitCost,
      "updated_at" .= updatedAt,
      "variant_url" .= variantUrl,
      "weight" .= weight
    ]
