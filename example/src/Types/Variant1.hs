{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Variant1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.CurrencyPrices1 (CurrencyPrices1)
import Types.Images5 (Images5)
import Types.Inventory3 (Inventory3)
import Types.LinkedProducts1 (LinkedProducts1)
import Types.Locations1 (Locations1)
import Types.OptionValues3 (OptionValues3)
import Types.Weight3 (Weight3)

data Variant1 = Variant1
  { barcode :: Maybe Text
  , createdAt :: Maybe Text
  , currencyPrices :: [CurrencyPrices1]
  , description :: Maybe Text
  , fulfillmentService :: Maybe Text
  , id :: Text
  , images :: [Images5]
  , inventory :: Maybe Inventory3
  , inventoryManagement :: Maybe Text
  , isoCurrencyCode :: Maybe Text
  , linkedProducts :: [LinkedProducts1]
  , optionValues :: [OptionValues3]
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
  , weight :: Maybe Weight3
  }
  deriving (Show, Eq)

instance FromJSON Variant1 where
  parseJSON = withObject "Variant1" $ \obj -> do
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
    pure $ Variant1{..}

instance ToJSON Variant1 where
  toJSON Variant1{..} =
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
