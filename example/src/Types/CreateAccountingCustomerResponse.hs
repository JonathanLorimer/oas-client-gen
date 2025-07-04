{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateAccountingCustomerResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse18 (AsyncResponse18)
import Types.CreateAccountingCustomerResponse1 (CreateAccountingCustomerResponse1)

data CreateAccountingCustomerResponse
  = CreateAccountingCustomerResponseVariant1 CreateAccountingCustomerResponse
  | CreateAccountingCustomerResponseVariant2 CreateAccountingCustomerResponse1
  deriving (Show, Eq)

instance FromJSON CreateAccountingCustomerResponse where
  parseJSON value = asum
    [ CreateAccountingCustomerResponseVariant1 <$> parseJSON value
    , CreateAccountingCustomerResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateAccountingCustomerResponse where
  toJSON = \case
    CreateAccountingCustomerResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateAccountingCustomerResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
