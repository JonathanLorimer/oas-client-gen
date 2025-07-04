{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PaymentMethodResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data PaymentMethodResponseWithConnection = PaymentMethodResponseWithConnection
  { connection :: Connection
  , paymentMethod :: PaymentMethod
  }
  deriving (Show, Eq)

instance FromJSON PaymentMethodResponseWithConnection where
  parseJSON = withObject "PaymentMethodResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    paymentMethod <- obj .: "payment_method"
    pure $ PaymentMethodResponseWithConnection{..}

instance ToJSON PaymentMethodResponseWithConnection where
  toJSON PaymentMethodResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "payment_method" .= paymentMethod
    ]
