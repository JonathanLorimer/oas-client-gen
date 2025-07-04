{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListPaymentMethodResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.PaymentMethod (PaymentMethod)

data ListPaymentMethodResponseWithConnection = ListPaymentMethodResponseWithConnection
  { connection :: Connection
  , nextCursor :: Maybe Text
  , paymentMethods :: [PaymentMethod]
  }
  deriving (Show, Eq)

instance FromJSON ListPaymentMethodResponseWithConnection where
  parseJSON = withObject "ListPaymentMethodResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    paymentMethods <- obj .: "payment_methods"
    pure $ ListPaymentMethodResponseWithConnection{..}

instance ToJSON ListPaymentMethodResponseWithConnection where
  toJSON ListPaymentMethodResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "next_cursor" .= nextCursor,
      "payment_methods" .= paymentMethods
    ]
