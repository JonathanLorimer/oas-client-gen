{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateBillPaymentRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields8 (AdditionalFields8)
import Types.CreateBillPayment (CreateBillPayment)
import Types.LinkedBills3 (LinkedBills3)

data CreateCreateBillPaymentRequest = CreateCreateBillPaymentRequest
  { billPayment :: CreateBillPayment
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateBillPaymentRequest where
  parseJSON = withObject "CreateCreateBillPaymentRequest" $ \obj -> do
    billPayment <- obj .: "bill_payment"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateBillPaymentRequest{..}

instance ToJSON CreateCreateBillPaymentRequest where
  toJSON CreateCreateBillPaymentRequest{..} =
    object [
      "bill_payment" .= billPayment,
      "response_mode" .= responseMode
    ]
