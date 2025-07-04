{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateBillCreditMemoRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields6 (AdditionalFields6)
import Types.CreateBillCreditMemo (CreateBillCreditMemo)
import Types.Item1 (Item1)
import Types.LineItems3 (LineItems3)

data CreateCreateBillCreditMemoRequest = CreateCreateBillCreditMemoRequest
  { billCreditMemo :: CreateBillCreditMemo
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateBillCreditMemoRequest where
  parseJSON = withObject "CreateCreateBillCreditMemoRequest" $ \obj -> do
    billCreditMemo <- obj .: "bill_credit_memo"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateBillCreditMemoRequest{..}

instance ToJSON CreateCreateBillCreditMemoRequest where
  toJSON CreateCreateBillCreditMemoRequest{..} =
    object [
      "bill_credit_memo" .= billCreditMemo,
      "response_mode" .= responseMode
    ]
