{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListAccountingCustomerRefundResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AccountingCustomerRefund (AccountingCustomerRefund)
import Types.AdditionalFields14 (AdditionalFields14)
import Types.Item4 (Item4)
import Types.LineItems6 (LineItems6)

data ListAccountingCustomerRefundResponseWithConnection = ListAccountingCustomerRefundResponseWithConnection
  { connection :: Connection
  , customerRefunds :: [AccountingCustomerRefund]
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListAccountingCustomerRefundResponseWithConnection where
  parseJSON = withObject "ListAccountingCustomerRefundResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    customerRefunds <- obj .: "customer_refunds"
    nextCursor <- obj .: "next_cursor"
    pure $ ListAccountingCustomerRefundResponseWithConnection{..}

instance ToJSON ListAccountingCustomerRefundResponseWithConnection where
  toJSON ListAccountingCustomerRefundResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "customer_refunds" .= customerRefunds,
      "next_cursor" .= nextCursor
    ]
