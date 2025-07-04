{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.IncomeStatement where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data IncomeStatement = IncomeStatement
  { accountingStandard :: Text
  , costOfSales :: GeneralLedgerLineItem
  , createdAt :: Maybe Text
  , currencyCode :: Text
  , endDate :: Text
  , expenses :: GeneralLedgerLineItem
  , grossProfit :: Maybe Text
  , id :: Text
  , income :: GeneralLedgerLineItem
  , netIncome :: Maybe Text
  , netOperatingIncome :: Maybe Text
  , netProfit :: Maybe Text
  , netSales :: Maybe Text
  , platformData :: Map Text Value
  , startDate :: Text
  , totalCostOfSales :: Maybe Text
  , totalExpenses :: Maybe Text
  , totalIncome :: Maybe Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON IncomeStatement where
  parseJSON = withObject "IncomeStatement" $ \obj -> do
    accountingStandard <- obj .: "accounting_standard"
    costOfSales <- obj .: "cost_of_sales"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    endDate <- obj .: "end_date"
    expenses <- obj .: "expenses"
    grossProfit <- obj .: "gross_profit"
    id <- obj .: "id"
    income <- obj .: "income"
    netIncome <- obj .: "net_income"
    netOperatingIncome <- obj .: "net_operating_income"
    netProfit <- obj .: "net_profit"
    netSales <- obj .: "net_sales"
    platformData <- obj .: "platform_data"
    startDate <- obj .: "start_date"
    totalCostOfSales <- obj .: "total_cost_of_sales"
    totalExpenses <- obj .: "total_expenses"
    totalIncome <- obj .: "total_income"
    updatedAt <- obj .: "updated_at"
    pure $ IncomeStatement{..}

instance ToJSON IncomeStatement where
  toJSON IncomeStatement{..} =
    object [
      "accounting_standard" .= accountingStandard,
      "cost_of_sales" .= costOfSales,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "end_date" .= endDate,
      "expenses" .= expenses,
      "gross_profit" .= grossProfit,
      "id" .= id,
      "income" .= income,
      "net_income" .= netIncome,
      "net_operating_income" .= netOperatingIncome,
      "net_profit" .= netProfit,
      "net_sales" .= netSales,
      "platform_data" .= platformData,
      "start_date" .= startDate,
      "total_cost_of_sales" .= totalCostOfSales,
      "total_expenses" .= totalExpenses,
      "total_income" .= totalIncome,
      "updated_at" .= updatedAt
    ]
