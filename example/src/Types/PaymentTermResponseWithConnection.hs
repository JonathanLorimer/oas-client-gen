{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PaymentTermResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data PaymentTermResponseWithConnection = PaymentTermResponseWithConnection
  { connection :: Connection
  , paymentTerm :: PaymentTerm
  }
  deriving (Show, Eq)

instance FromJSON PaymentTermResponseWithConnection where
  parseJSON = withObject "PaymentTermResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    paymentTerm <- obj .: "payment_term"
    pure $ PaymentTermResponseWithConnection{..}

instance ToJSON PaymentTermResponseWithConnection where
  toJSON PaymentTermResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "payment_term" .= paymentTerm
    ]
