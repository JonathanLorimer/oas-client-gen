{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateBillCreditApplicationRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields4 (AdditionalFields4)
import Types.CreateBillCreditApplication (CreateBillCreditApplication)
import Types.LinkedBills (LinkedBills)

data CreateCreateBillCreditApplicationRequest = CreateCreateBillCreditApplicationRequest
  { billCreditApplication :: CreateBillCreditApplication
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateBillCreditApplicationRequest where
  parseJSON = withObject "CreateCreateBillCreditApplicationRequest" $ \obj -> do
    billCreditApplication <- obj .: "bill_credit_application"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateBillCreditApplicationRequest{..}

instance ToJSON CreateCreateBillCreditApplicationRequest where
  toJSON CreateCreateBillCreditApplicationRequest{..} =
    object [
      "bill_credit_application" .= billCreditApplication,
      "response_mode" .= responseMode
    ]
