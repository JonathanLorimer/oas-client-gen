{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListBillCreditMemoResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields5 (AdditionalFields5)
import Types.BillCreditMemo (BillCreditMemo)
import Types.Item (Item)
import Types.LineItems2 (LineItems2)
import Types.LinkedBills1 (LinkedBills1)

data ListBillCreditMemoResponseWithConnection = ListBillCreditMemoResponseWithConnection
  { billCreditMemos :: [BillCreditMemo]
  , connection :: Connection
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListBillCreditMemoResponseWithConnection where
  parseJSON = withObject "ListBillCreditMemoResponseWithConnection" $ \obj -> do
    billCreditMemos <- obj .: "bill_credit_memos"
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    pure $ ListBillCreditMemoResponseWithConnection{..}

instance ToJSON ListBillCreditMemoResponseWithConnection where
  toJSON ListBillCreditMemoResponseWithConnection{..} =
    object [
      "bill_credit_memos" .= billCreditMemos,
      "connection" .= connection,
      "next_cursor" .= nextCursor
    ]
