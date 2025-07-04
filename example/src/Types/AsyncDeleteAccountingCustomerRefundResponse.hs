{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteAccountingCustomerRefundResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncDeleteAccountingCustomerRefundResponse1 (AsyncDeleteAccountingCustomerRefundResponse1)
import Types.AsyncResponse17 (AsyncResponse17)

data AsyncDeleteAccountingCustomerRefundResponse
  = AsyncDeleteAccountingCustomerRefundResponseVariant1 AsyncDeleteAccountingCustomerRefundResponse
  | AsyncDeleteAccountingCustomerRefundResponseVariant2 AsyncDeleteAccountingCustomerRefundResponse1
  deriving (Show, Eq)

instance FromJSON AsyncDeleteAccountingCustomerRefundResponse where
  parseJSON value = asum
    [ AsyncDeleteAccountingCustomerRefundResponseVariant1 <$> parseJSON value
    , AsyncDeleteAccountingCustomerRefundResponseVariant2 <$> parseJSON value
    ]

instance ToJSON AsyncDeleteAccountingCustomerRefundResponse where
  toJSON = \case
    AsyncDeleteAccountingCustomerRefundResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    AsyncDeleteAccountingCustomerRefundResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
