{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListListIncomeStatementResponseResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AsyncResponse22 (AsyncResponse22)
import Types.IncomeStatement (IncomeStatement)
import Types.ListListIncomeStatementResponseResponse1 (ListListIncomeStatementResponseResponse1)

data ListListIncomeStatementResponseResponse
  = ListListIncomeStatementResponseResponseVariant1 ListListIncomeStatementResponseResponse
  | ListListIncomeStatementResponseResponseVariant2 ListListIncomeStatementResponseResponse1
  deriving (Show, Eq)

instance FromJSON ListListIncomeStatementResponseResponse where
  parseJSON value = asum
    [ ListListIncomeStatementResponseResponseVariant1 <$> parseJSON value
    , ListListIncomeStatementResponseResponseVariant2 <$> parseJSON value
    ]

instance ToJSON ListListIncomeStatementResponseResponse where
  toJSON = \case
    ListListIncomeStatementResponseResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    ListListIncomeStatementResponseResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
