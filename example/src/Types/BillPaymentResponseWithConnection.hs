{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BillPaymentResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BillPaymentResponseWithConnection = BillPaymentResponseWithConnection
  { billPayment :: BillPayment
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON BillPaymentResponseWithConnection where
  parseJSON = withObject "BillPaymentResponseWithConnection" $ \obj -> do
    billPayment <- obj .: "bill_payment"
    connection <- obj .: "connection"
    pure $ BillPaymentResponseWithConnection{..}

instance ToJSON BillPaymentResponseWithConnection where
  toJSON BillPaymentResponseWithConnection{..} =
    object [
      "bill_payment" .= billPayment,
      "connection" .= connection
    ]
