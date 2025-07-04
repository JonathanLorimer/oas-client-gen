{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateBillRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields11 (AdditionalFields11)
import Types.AdditionalFields12 (AdditionalFields12)
import Types.CreateBill (CreateBill)
import Types.Item3 (Item3)
import Types.LineItems5 (LineItems5)
import Types.LinkedPurchaseOrders1 (LinkedPurchaseOrders1)

data CreateCreateBillRequest = CreateCreateBillRequest
  { bill :: CreateBill
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateBillRequest where
  parseJSON = withObject "CreateCreateBillRequest" $ \obj -> do
    bill <- obj .: "bill"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateBillRequest{..}

instance ToJSON CreateCreateBillRequest where
  toJSON CreateCreateBillRequest{..} =
    object [
      "bill" .= bill,
      "response_mode" .= responseMode
    ]
