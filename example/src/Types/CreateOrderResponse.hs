{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateOrderResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateOrderResponse = CreateOrderResponse
  { order :: Order
  }
  deriving (Show, Eq)

instance FromJSON CreateOrderResponse where
  parseJSON = withObject "CreateOrderResponse" $ \obj -> do
    order <- obj .: "order"
    pure $ CreateOrderResponse{..}

instance ToJSON CreateOrderResponse where
  toJSON CreateOrderResponse{..} =
    object [
      "order" .= order
    ]
