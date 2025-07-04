{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.HistoricalSyncStatus where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Batches (Batches)
import Types.Config (Config)
import Types.Entities (Entities)
import Types.ExpectedEntityCounts (ExpectedEntityCounts)
import Types.Orders (Orders)
import Types.Products (Products)
import Types.Variants (Variants)
import Types.Orders (Orders)
import Types.Products (Products)

data HistoricalSyncStatus = HistoricalSyncStatus
  { batches :: [Batches]
  , expectedEntityCounts :: Maybe [ExpectedEntityCounts]
  , historicalSyncCompleted :: Bool
  , numBatchesCompleted :: Maybe Double
  , syncedBalanceSheetsCount :: Maybe Double
  , syncedCashFlowsCount :: Maybe Double
  , syncedIncomeStatementsCount :: Maybe Double
  , syncedOrdersCount :: Maybe Double
  , syncedTransactionsCount :: Maybe Double
  , total :: Map Text Value
  }
  deriving (Show, Eq)

instance FromJSON HistoricalSyncStatus where
  parseJSON = withObject "HistoricalSyncStatus" $ \obj -> do
    batches <- obj .: "batches"
    expectedEntityCounts <- obj .: "expected_entity_counts"
    historicalSyncCompleted <- obj .: "historical_sync_completed"
    numBatchesCompleted <- obj .: "num_batches_completed"
    syncedBalanceSheetsCount <- obj .: "synced_balance_sheets_count"
    syncedCashFlowsCount <- obj .: "synced_cash_flows_count"
    syncedIncomeStatementsCount <- obj .: "synced_income_statements_count"
    syncedOrdersCount <- obj .: "synced_orders_count"
    syncedTransactionsCount <- obj .: "synced_transactions_count"
    total <- obj .: "total"
    pure $ HistoricalSyncStatus{..}

instance ToJSON HistoricalSyncStatus where
  toJSON HistoricalSyncStatus{..} =
    object [
      "batches" .= batches,
      "expected_entity_counts" .= expectedEntityCounts,
      "historical_sync_completed" .= historicalSyncCompleted,
      "num_batches_completed" .= numBatchesCompleted,
      "synced_balance_sheets_count" .= syncedBalanceSheetsCount,
      "synced_cash_flows_count" .= syncedCashFlowsCount,
      "synced_income_statements_count" .= syncedIncomeStatementsCount,
      "synced_orders_count" .= syncedOrdersCount,
      "synced_transactions_count" .= syncedTransactionsCount,
      "total" .= total
    ]
