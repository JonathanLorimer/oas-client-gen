{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteBillPaymentResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncDeleteBillPaymentResponse1 (AsyncDeleteBillPaymentResponse1)
import Types.AsyncResponse11 (AsyncResponse11)

data AsyncDeleteBillPaymentResponse
  = AsyncDeleteBillPaymentResponseVariant1 AsyncDeleteBillPaymentResponse
  | AsyncDeleteBillPaymentResponseVariant2 AsyncDeleteBillPaymentResponse1
  deriving (Show, Eq)

instance FromJSON AsyncDeleteBillPaymentResponse where
  parseJSON value = asum
    [ AsyncDeleteBillPaymentResponseVariant1 <$> parseJSON value
    , AsyncDeleteBillPaymentResponseVariant2 <$> parseJSON value
    ]

instance ToJSON AsyncDeleteBillPaymentResponse where
  toJSON = \case
    AsyncDeleteBillPaymentResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    AsyncDeleteBillPaymentResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
