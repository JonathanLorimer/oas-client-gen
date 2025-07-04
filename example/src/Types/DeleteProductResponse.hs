{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.DeleteProductResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data DeleteProductResponse = DeleteProductResponse
  { product :: Text
  , success :: Bool
  }
  deriving (Show, Eq)

instance FromJSON DeleteProductResponse where
  parseJSON = withObject "DeleteProductResponse" $ \obj -> do
    product <- obj .: "product"
    success <- obj .: "success"
    pure $ DeleteProductResponse{..}

instance ToJSON DeleteProductResponse where
  toJSON DeleteProductResponse{..} =
    object [
      "product" .= product,
      "success" .= success
    ]
