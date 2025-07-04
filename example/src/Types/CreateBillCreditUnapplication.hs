{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBillCreditUnapplication where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateBillCreditUnapplication = CreateBillCreditUnapplication
  { billCreditMemoId :: Text
  , billId :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateBillCreditUnapplication where
  parseJSON = withObject "CreateBillCreditUnapplication" $ \obj -> do
    billCreditMemoId <- obj .: "bill_credit_memo_id"
    billId <- obj .: "bill_id"
    pure $ CreateBillCreditUnapplication{..}

instance ToJSON CreateBillCreditUnapplication where
  toJSON CreateBillCreditUnapplication{..} =
    object [
      "bill_credit_memo_id" .= billCreditMemoId,
      "bill_id" .= billId
    ]
