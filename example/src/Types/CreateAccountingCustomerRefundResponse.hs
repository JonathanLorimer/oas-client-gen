{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateAccountingCustomerRefundResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse16 (AsyncResponse16)
import Types.CreateAccountingCustomerRefundResponse1 (CreateAccountingCustomerRefundResponse1)

data CreateAccountingCustomerRefundResponse
  = CreateAccountingCustomerRefundResponseVariant1 CreateAccountingCustomerRefundResponse
  | CreateAccountingCustomerRefundResponseVariant2 CreateAccountingCustomerRefundResponse1
  deriving (Show, Eq)

instance FromJSON CreateAccountingCustomerRefundResponse where
  parseJSON value = asum
    [ CreateAccountingCustomerRefundResponseVariant1 <$> parseJSON value
    , CreateAccountingCustomerRefundResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateAccountingCustomerRefundResponse where
  toJSON = \case
    CreateAccountingCustomerRefundResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateAccountingCustomerRefundResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
