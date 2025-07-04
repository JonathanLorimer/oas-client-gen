{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListOrdersResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ListOrdersResponse = ListOrdersResponse
  { connection :: Connection
  , nextCursor :: Maybe Text
  , orders :: Orders
  }
  deriving (Show, Eq)

instance FromJSON ListOrdersResponse where
  parseJSON = withObject "ListOrdersResponse" $ \obj -> do
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    orders <- obj .: "orders"
    pure $ ListOrdersResponse{..}

instance ToJSON ListOrdersResponse where
  toJSON ListOrdersResponse{..} =
    object [
      "connection" .= connection,
      "next_cursor" .= nextCursor,
      "orders" .= orders
    ]
