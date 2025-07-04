{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBillPaymentResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse10 (AsyncResponse10)
import Types.CreateBillPaymentResponse1 (CreateBillPaymentResponse1)

data CreateBillPaymentResponse
  = CreateBillPaymentResponseVariant1 CreateBillPaymentResponse
  | CreateBillPaymentResponseVariant2 CreateBillPaymentResponse1
  deriving (Show, Eq)

instance FromJSON CreateBillPaymentResponse where
  parseJSON value = asum
    [ CreateBillPaymentResponseVariant1 <$> parseJSON value
    , CreateBillPaymentResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateBillPaymentResponse where
  toJSON = \case
    CreateBillPaymentResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateBillPaymentResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
