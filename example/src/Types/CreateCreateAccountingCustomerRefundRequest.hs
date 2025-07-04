{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateAccountingCustomerRefundRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields15 (AdditionalFields15)
import Types.AdditionalFields16 (AdditionalFields16)
import Types.CreateAccountingCustomerRefund (CreateAccountingCustomerRefund)
import Types.Item5 (Item5)
import Types.LineItems7 (LineItems7)

data CreateCreateAccountingCustomerRefundRequest = CreateCreateAccountingCustomerRefundRequest
  { customerRefund :: CreateAccountingCustomerRefund
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateAccountingCustomerRefundRequest where
  parseJSON = withObject "CreateCreateAccountingCustomerRefundRequest" $ \obj -> do
    customerRefund <- obj .: "customer_refund"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateAccountingCustomerRefundRequest{..}

instance ToJSON CreateCreateAccountingCustomerRefundRequest where
  toJSON CreateCreateAccountingCustomerRefundRequest{..} =
    object [
      "customer_refund" .= customerRefund,
      "response_mode" .= responseMode
    ]
