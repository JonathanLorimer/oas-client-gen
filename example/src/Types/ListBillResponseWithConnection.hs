{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListBillResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields10 (AdditionalFields10)
import Types.AdditionalFields9 (AdditionalFields9)
import Types.Bill (Bill)
import Types.Item2 (Item2)
import Types.LineItems4 (LineItems4)
import Types.LinkedCreditMemos (LinkedCreditMemos)
import Types.LinkedJournalEntries1 (LinkedJournalEntries1)
import Types.LinkedPayments2 (LinkedPayments2)
import Types.LinkedPurchaseOrders (LinkedPurchaseOrders)

data ListBillResponseWithConnection = ListBillResponseWithConnection
  { bills :: [Bill]
  , connection :: Connection
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListBillResponseWithConnection where
  parseJSON = withObject "ListBillResponseWithConnection" $ \obj -> do
    bills <- obj .: "bills"
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    pure $ ListBillResponseWithConnection{..}

instance ToJSON ListBillResponseWithConnection where
  toJSON ListBillResponseWithConnection{..} =
    object [
      "bills" .= bills,
      "connection" .= connection,
      "next_cursor" .= nextCursor
    ]
