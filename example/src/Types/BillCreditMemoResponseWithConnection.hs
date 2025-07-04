{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BillCreditMemoResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BillCreditMemoResponseWithConnection = BillCreditMemoResponseWithConnection
  { billCreditMemo :: BillCreditMemo
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON BillCreditMemoResponseWithConnection where
  parseJSON = withObject "BillCreditMemoResponseWithConnection" $ \obj -> do
    billCreditMemo <- obj .: "bill_credit_memo"
    connection <- obj .: "connection"
    pure $ BillCreditMemoResponseWithConnection{..}

instance ToJSON BillCreditMemoResponseWithConnection where
  toJSON BillCreditMemoResponseWithConnection{..} =
    object [
      "bill_credit_memo" .= billCreditMemo,
      "connection" .= connection
    ]
