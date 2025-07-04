{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListProductsResponse where

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
import Types.Product (Product)
import Types.Variants1 (Variants1)
import Types.Weight (Weight)
import Types.Status_1 (Status_1)

data ListProductsResponse = ListProductsResponse
  { connection :: Connection
  , nextCursor :: Maybe Text
  , products :: [Product]
  }
  deriving (Show, Eq)

instance FromJSON ListProductsResponse where
  parseJSON = withObject "ListProductsResponse" $ \obj -> do
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    products <- obj .: "products"
    pure $ ListProductsResponse{..}

instance ToJSON ListProductsResponse where
  toJSON ListProductsResponse{..} =
    object [
      "connection" .= connection,
      "next_cursor" .= nextCursor,
      "products" .= products
    ]
