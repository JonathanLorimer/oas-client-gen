{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AggregateAccountingMetricResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AggregateMetric (AggregateMetric)

data AggregateAccountingMetricResponse = AggregateAccountingMetricResponse
  { amortizationExpense :: [AggregateMetric]
  , capitalExpenditure :: [AggregateMetric]
  , cashFlowToDebtRatio :: [AggregateMetric]
  , changeInWorkingCapital :: [AggregateMetric]
  , checkpoint :: Text
  , connection :: Connection
  , costOfGoodsSold :: [AggregateMetric]
  , currentAssets :: [AggregateMetric]
  , currentLiabilities :: [AggregateMetric]
  , currentRatio :: [AggregateMetric]
  , debtService :: [AggregateMetric]
  , debtServiceCoverageRatio :: [AggregateMetric]
  , debtServiceFromIncomeStatement :: [AggregateMetric]
  , debtServiceFromPrincipalPaid :: [AggregateMetric]
  , debtToIncomeRatio :: [AggregateMetric]
  , depreciationExpense :: [AggregateMetric]
  , ebitda :: [AggregateMetric]
  , ebitdaMargin :: [AggregateMetric]
  , enterpriseFreeCashFlow :: [AggregateMetric]
  , enterpriseFreeCashFlowFormulaTwo :: [AggregateMetric]
  , grossProfitMargin :: [AggregateMetric]
  , interestExpense :: [AggregateMetric]
  , inventory :: [AggregateMetric]
  , netIncome :: [AggregateMetric]
  , netOperatingIncome :: [AggregateMetric]
  , netProfitMargin :: [AggregateMetric]
  , prepaidExpenses :: [AggregateMetric]
  , principalPaid :: [AggregateMetric]
  , quickRatio :: [AggregateMetric]
  , rentalExpense :: [AggregateMetric]
  , totalExpenses :: [AggregateMetric]
  , totalIncome :: [AggregateMetric]
  , totalRevenue :: [AggregateMetric]
  , unearnedRevenues :: [AggregateMetric]
  , workingCapital :: [AggregateMetric]
  }
  deriving (Show, Eq)

instance FromJSON AggregateAccountingMetricResponse where
  parseJSON = withObject "AggregateAccountingMetricResponse" $ \obj -> do
    amortizationExpense <- obj .: "amortization_expense"
    capitalExpenditure <- obj .: "capital_expenditure"
    cashFlowToDebtRatio <- obj .: "cash_flow_to_debt_ratio"
    changeInWorkingCapital <- obj .: "change_in_working_capital"
    checkpoint <- obj .: "checkpoint"
    connection <- obj .: "connection"
    costOfGoodsSold <- obj .: "cost_of_goods_sold"
    currentAssets <- obj .: "current_assets"
    currentLiabilities <- obj .: "current_liabilities"
    currentRatio <- obj .: "current_ratio"
    debtService <- obj .: "debt_service"
    debtServiceCoverageRatio <- obj .: "debt_service_coverage_ratio"
    debtServiceFromIncomeStatement <- obj .: "debt_service_from_income_statement"
    debtServiceFromPrincipalPaid <- obj .: "debt_service_from_principal_paid"
    debtToIncomeRatio <- obj .: "debt_to_income_ratio"
    depreciationExpense <- obj .: "depreciation_expense"
    ebitda <- obj .: "ebitda"
    ebitdaMargin <- obj .: "ebitda_margin"
    enterpriseFreeCashFlow <- obj .: "enterprise_free_cash_flow"
    enterpriseFreeCashFlowFormulaTwo <- obj .: "enterprise_free_cash_flow_formula_two"
    grossProfitMargin <- obj .: "gross_profit_margin"
    interestExpense <- obj .: "interest_expense"
    inventory <- obj .: "inventory"
    netIncome <- obj .: "net_income"
    netOperatingIncome <- obj .: "net_operating_income"
    netProfitMargin <- obj .: "net_profit_margin"
    prepaidExpenses <- obj .: "prepaid_expenses"
    principalPaid <- obj .: "principal_paid"
    quickRatio <- obj .: "quick_ratio"
    rentalExpense <- obj .: "rental_expense"
    totalExpenses <- obj .: "total_expenses"
    totalIncome <- obj .: "total_income"
    totalRevenue <- obj .: "total_revenue"
    unearnedRevenues <- obj .: "unearned_revenues"
    workingCapital <- obj .: "working_capital"
    pure $ AggregateAccountingMetricResponse{..}

instance ToJSON AggregateAccountingMetricResponse where
  toJSON AggregateAccountingMetricResponse{..} =
    object [
      "amortization_expense" .= amortizationExpense,
      "capital_expenditure" .= capitalExpenditure,
      "cash_flow_to_debt_ratio" .= cashFlowToDebtRatio,
      "change_in_working_capital" .= changeInWorkingCapital,
      "checkpoint" .= checkpoint,
      "connection" .= connection,
      "cost_of_goods_sold" .= costOfGoodsSold,
      "current_assets" .= currentAssets,
      "current_liabilities" .= currentLiabilities,
      "current_ratio" .= currentRatio,
      "debt_service" .= debtService,
      "debt_service_coverage_ratio" .= debtServiceCoverageRatio,
      "debt_service_from_income_statement" .= debtServiceFromIncomeStatement,
      "debt_service_from_principal_paid" .= debtServiceFromPrincipalPaid,
      "debt_to_income_ratio" .= debtToIncomeRatio,
      "depreciation_expense" .= depreciationExpense,
      "ebitda" .= ebitda,
      "ebitda_margin" .= ebitdaMargin,
      "enterprise_free_cash_flow" .= enterpriseFreeCashFlow,
      "enterprise_free_cash_flow_formula_two" .= enterpriseFreeCashFlowFormulaTwo,
      "gross_profit_margin" .= grossProfitMargin,
      "interest_expense" .= interestExpense,
      "inventory" .= inventory,
      "net_income" .= netIncome,
      "net_operating_income" .= netOperatingIncome,
      "net_profit_margin" .= netProfitMargin,
      "prepaid_expenses" .= prepaidExpenses,
      "principal_paid" .= principalPaid,
      "quick_ratio" .= quickRatio,
      "rental_expense" .= rentalExpense,
      "total_expenses" .= totalExpenses,
      "total_income" .= totalIncome,
      "total_revenue" .= totalRevenue,
      "unearned_revenues" .= unearnedRevenues,
      "working_capital" .= workingCapital
    ]
