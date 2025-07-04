{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListBalanceSheetResultResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AsyncResponse1 (AsyncResponse1)
import Types.BalanceSheet (BalanceSheet)
import Types.GeneralLedgerLineItem (GeneralLedgerLineItem)
import Types.ListBalanceSheetResultResponse1 (ListBalanceSheetResultResponse1)

data ListBalanceSheetResultResponse
  = ListBalanceSheetResultResponseVariant1 ListBalanceSheetResultResponse
  | ListBalanceSheetResultResponseVariant2 ListBalanceSheetResultResponse1
  deriving (Show, Eq)

instance FromJSON ListBalanceSheetResultResponse where
  parseJSON value = asum
    [ ListBalanceSheetResultResponseVariant1 <$> parseJSON value
    , ListBalanceSheetResultResponseVariant2 <$> parseJSON value
    ]

instance ToJSON ListBalanceSheetResultResponse where
  toJSON = \case
    ListBalanceSheetResultResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    ListBalanceSheetResultResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
