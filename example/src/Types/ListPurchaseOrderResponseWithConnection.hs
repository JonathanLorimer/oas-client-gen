{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListPurchaseOrderResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Item10 (Item10)
import Types.LineItems16 (LineItems16)
import Types.PurchaseOrder (PurchaseOrder)

data ListPurchaseOrderResponseWithConnection = ListPurchaseOrderResponseWithConnection
  { connection :: Connection
  , nextCursor :: Maybe Text
  , purchaseOrders :: [PurchaseOrder]
  }
  deriving (Show, Eq)

instance FromJSON ListPurchaseOrderResponseWithConnection where
  parseJSON = withObject "ListPurchaseOrderResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    purchaseOrders <- obj .: "purchase_orders"
    pure $ ListPurchaseOrderResponseWithConnection{..}

instance ToJSON ListPurchaseOrderResponseWithConnection where
  toJSON ListPurchaseOrderResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "next_cursor" .= nextCursor,
      "purchase_orders" .= purchaseOrders
    ]
