{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListPaymentTermResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.PaymentTerm (PaymentTerm)

data ListPaymentTermResponseWithConnection = ListPaymentTermResponseWithConnection
  { connection :: Connection
  , nextCursor :: Maybe Text
  , paymentTerms :: [PaymentTerm]
  }
  deriving (Show, Eq)

instance FromJSON ListPaymentTermResponseWithConnection where
  parseJSON = withObject "ListPaymentTermResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    paymentTerms <- obj .: "payment_terms"
    pure $ ListPaymentTermResponseWithConnection{..}

instance ToJSON ListPaymentTermResponseWithConnection where
  toJSON ListPaymentTermResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "next_cursor" .= nextCursor,
      "payment_terms" .= paymentTerms
    ]
