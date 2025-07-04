{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.GetProductResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data GetProductResponse = GetProductResponse
  { connection :: Connection
  , product :: Product
  }
  deriving (Show, Eq)

instance FromJSON GetProductResponse where
  parseJSON = withObject "GetProductResponse" $ \obj -> do
    connection <- obj .: "connection"
    product <- obj .: "product"
    pure $ GetProductResponse{..}

instance ToJSON GetProductResponse where
  toJSON GetProductResponse{..} =
    object [
      "connection" .= connection,
      "product" .= product
    ]
