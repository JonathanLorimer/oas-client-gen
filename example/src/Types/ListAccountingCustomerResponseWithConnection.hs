{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListAccountingCustomerResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AccountingCustomer (AccountingCustomer)
import Types.Addresses (Addresses)

data ListAccountingCustomerResponseWithConnection = ListAccountingCustomerResponseWithConnection
  { connection :: Connection
  , customers :: [AccountingCustomer]
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListAccountingCustomerResponseWithConnection where
  parseJSON = withObject "ListAccountingCustomerResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    customers <- obj .: "customers"
    nextCursor <- obj .: "next_cursor"
    pure $ ListAccountingCustomerResponseWithConnection{..}

instance ToJSON ListAccountingCustomerResponseWithConnection where
  toJSON ListAccountingCustomerResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "customers" .= customers,
      "next_cursor" .= nextCursor
    ]
