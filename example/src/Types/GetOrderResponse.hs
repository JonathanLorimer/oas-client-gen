{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.GetOrderResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data GetOrderResponse = GetOrderResponse
  { connection :: Connection
  , order :: Order
  }
  deriving (Show, Eq)

instance FromJSON GetOrderResponse where
  parseJSON = withObject "GetOrderResponse" $ \obj -> do
    connection <- obj .: "connection"
    order <- obj .: "order"
    pure $ GetOrderResponse{..}

instance ToJSON GetOrderResponse where
  toJSON GetOrderResponse{..} =
    object [
      "connection" .= connection,
      "order" .= order
    ]
