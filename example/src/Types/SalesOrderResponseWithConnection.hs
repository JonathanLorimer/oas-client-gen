{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.SalesOrderResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data SalesOrderResponseWithConnection = SalesOrderResponseWithConnection
  { connection :: Connection
  , salesOrder :: SalesOrder
  }
  deriving (Show, Eq)

instance FromJSON SalesOrderResponseWithConnection where
  parseJSON = withObject "SalesOrderResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    salesOrder <- obj .: "sales_order"
    pure $ SalesOrderResponseWithConnection{..}

instance ToJSON SalesOrderResponseWithConnection where
  toJSON SalesOrderResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "sales_order" .= salesOrder
    ]
