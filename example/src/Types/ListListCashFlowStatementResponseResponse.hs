{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListListCashFlowStatementResponseResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AsyncResponse14 (AsyncResponse14)
import Types.CashFlowStatement (CashFlowStatement)
import Types.ListListCashFlowStatementResponseResponse1 (ListListCashFlowStatementResponseResponse1)

data ListListCashFlowStatementResponseResponse
  = ListListCashFlowStatementResponseResponseVariant1 ListListCashFlowStatementResponseResponse
  | ListListCashFlowStatementResponseResponseVariant2 ListListCashFlowStatementResponseResponse1
  deriving (Show, Eq)

instance FromJSON ListListCashFlowStatementResponseResponse where
  parseJSON value = asum
    [ ListListCashFlowStatementResponseResponseVariant1 <$> parseJSON value
    , ListListCashFlowStatementResponseResponseVariant2 <$> parseJSON value
    ]

instance ToJSON ListListCashFlowStatementResponseResponse where
  toJSON = \case
    ListListCashFlowStatementResponseResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    ListListCashFlowStatementResponseResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
