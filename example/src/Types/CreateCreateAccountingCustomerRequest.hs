{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateAccountingCustomerRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields17 (AdditionalFields17)
import Types.Addresses1 (Addresses1)
import Types.CreateAccountingCustomer (CreateAccountingCustomer)

data CreateCreateAccountingCustomerRequest = CreateCreateAccountingCustomerRequest
  { customer :: CreateAccountingCustomer
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateAccountingCustomerRequest where
  parseJSON = withObject "CreateCreateAccountingCustomerRequest" $ \obj -> do
    customer <- obj .: "customer"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateAccountingCustomerRequest{..}

instance ToJSON CreateCreateAccountingCustomerRequest where
  toJSON CreateCreateAccountingCustomerRequest{..} =
    object [
      "customer" .= customer,
      "response_mode" .= responseMode
    ]
