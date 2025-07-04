{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CashFlowStatement where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data CashFlowStatement = CashFlowStatement
  { createdAt :: Maybe Text
  , currencyCode :: Text
  , endDate :: Text
  , endingBalance :: Maybe Text
  , financingActivities :: GeneralLedgerLineItem
  , grossCashInFlow :: Maybe Text
  , grossCashOutFlow :: Maybe Text
  , id :: Text
  , investingActivities :: GeneralLedgerLineItem
  , operatingActivities :: GeneralLedgerLineItem
  , platformData :: Map Text Value
  , startDate :: Text
  , startingBalance :: Maybe Text
  , totalFinancing :: Maybe Text
  , totalInvesting :: Maybe Text
  , totalOperating :: Maybe Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON CashFlowStatement where
  parseJSON = withObject "CashFlowStatement" $ \obj -> do
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    endDate <- obj .: "end_date"
    endingBalance <- obj .: "ending_balance"
    financingActivities <- obj .: "financing_activities"
    grossCashInFlow <- obj .: "gross_cash_in_flow"
    grossCashOutFlow <- obj .: "gross_cash_out_flow"
    id <- obj .: "id"
    investingActivities <- obj .: "investing_activities"
    operatingActivities <- obj .: "operating_activities"
    platformData <- obj .: "platform_data"
    startDate <- obj .: "start_date"
    startingBalance <- obj .: "starting_balance"
    totalFinancing <- obj .: "total_financing"
    totalInvesting <- obj .: "total_investing"
    totalOperating <- obj .: "total_operating"
    updatedAt <- obj .: "updated_at"
    pure $ CashFlowStatement{..}

instance ToJSON CashFlowStatement where
  toJSON CashFlowStatement{..} =
    object [
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "end_date" .= endDate,
      "ending_balance" .= endingBalance,
      "financing_activities" .= financingActivities,
      "gross_cash_in_flow" .= grossCashInFlow,
      "gross_cash_out_flow" .= grossCashOutFlow,
      "id" .= id,
      "investing_activities" .= investingActivities,
      "operating_activities" .= operatingActivities,
      "platform_data" .= platformData,
      "start_date" .= startDate,
      "starting_balance" .= startingBalance,
      "total_financing" .= totalFinancing,
      "total_investing" .= totalInvesting,
      "total_operating" .= totalOperating,
      "updated_at" .= updatedAt
    ]
