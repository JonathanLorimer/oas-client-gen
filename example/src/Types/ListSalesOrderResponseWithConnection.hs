{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListSalesOrderResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Item11 (Item11)
import Types.LineItems19 (LineItems19)
import Types.SalesOrder (SalesOrder)

data ListSalesOrderResponseWithConnection = ListSalesOrderResponseWithConnection
  { connection :: Connection
  , nextCursor :: Maybe Text
  , salesOrders :: [SalesOrder]
  }
  deriving (Show, Eq)

instance FromJSON ListSalesOrderResponseWithConnection where
  parseJSON = withObject "ListSalesOrderResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    salesOrders <- obj .: "sales_orders"
    pure $ ListSalesOrderResponseWithConnection{..}

instance ToJSON ListSalesOrderResponseWithConnection where
  toJSON ListSalesOrderResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "next_cursor" .= nextCursor,
      "sales_orders" .= salesOrders
    ]
