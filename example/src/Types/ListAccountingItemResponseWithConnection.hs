{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListAccountingItemResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AccountingItem (AccountingItem)
import Types.BillItem (BillItem)
import Types.InvoiceItem (InvoiceItem)
import Types.Subsidiaries1 (Subsidiaries1)

data ListAccountingItemResponseWithConnection = ListAccountingItemResponseWithConnection
  { connection :: Connection
  , items :: [AccountingItem]
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListAccountingItemResponseWithConnection where
  parseJSON = withObject "ListAccountingItemResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    items <- obj .: "items"
    nextCursor <- obj .: "next_cursor"
    pure $ ListAccountingItemResponseWithConnection{..}

instance ToJSON ListAccountingItemResponseWithConnection where
  toJSON ListAccountingItemResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "items" .= items,
      "next_cursor" .= nextCursor
    ]
