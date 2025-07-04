{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AccountingCustomerResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AccountingCustomerResponseWithConnection = AccountingCustomerResponseWithConnection
  { connection :: Connection
  , customer :: AccountingCustomer
  }
  deriving (Show, Eq)

instance FromJSON AccountingCustomerResponseWithConnection where
  parseJSON = withObject "AccountingCustomerResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    customer <- obj .: "customer"
    pure $ AccountingCustomerResponseWithConnection{..}

instance ToJSON AccountingCustomerResponseWithConnection where
  toJSON AccountingCustomerResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "customer" .= customer
    ]
