{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AccountingCustomerRefundResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AccountingCustomerRefundResponseWithConnection = AccountingCustomerRefundResponseWithConnection
  { connection :: Connection
  , customerRefund :: AccountingCustomerRefund
  }
  deriving (Show, Eq)

instance FromJSON AccountingCustomerRefundResponseWithConnection where
  parseJSON = withObject "AccountingCustomerRefundResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    customerRefund <- obj .: "customer_refund"
    pure $ AccountingCustomerRefundResponseWithConnection{..}

instance ToJSON AccountingCustomerRefundResponseWithConnection where
  toJSON AccountingCustomerRefundResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "customer_refund" .= customerRefund
    ]
