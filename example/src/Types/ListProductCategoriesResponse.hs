{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListProductCategoriesResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ProductCategory (ProductCategory)

data ListProductCategoriesResponse = ListProductCategoriesResponse
  { categories :: [ProductCategory]
  }
  deriving (Show, Eq)

instance FromJSON ListProductCategoriesResponse where
  parseJSON = withObject "ListProductCategoriesResponse" $ \obj -> do
    categories <- obj .: "categories"
    pure $ ListProductCategoriesResponse{..}

instance ToJSON ListProductCategoriesResponse where
  toJSON ListProductCategoriesResponse{..} =
    object [
      "categories" .= categories
    ]
