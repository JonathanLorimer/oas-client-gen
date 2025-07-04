{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateProductResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateProductResponse1 = CreateProductResponse1
  { product :: Product
  }
  deriving (Show, Eq)

instance FromJSON CreateProductResponse1 where
  parseJSON = withObject "CreateProductResponse1" $ \obj -> do
    product <- obj .: "product"
    pure $ CreateProductResponse1{..}

instance ToJSON CreateProductResponse1 where
  toJSON CreateProductResponse1{..} =
    object [
      "product" .= product
    ]
