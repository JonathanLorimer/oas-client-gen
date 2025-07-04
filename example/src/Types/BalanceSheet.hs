{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BalanceSheet where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.GeneralLedgerLineItem (GeneralLedgerLineItem)

data BalanceSheet = BalanceSheet
  { assets :: GeneralLedgerLineItem
  , createdAt :: Maybe Text
  , currencyCode :: Text
  , endDate :: Text
  , equity :: GeneralLedgerLineItem
  , id :: Text
  , liabilities :: GeneralLedgerLineItem
  , platformData :: Map Text Value
  , startDate :: Text
  , totalAssets :: Maybe Text
  , totalEquity :: Maybe Text
  , totalLiabilities :: Maybe Text
  , updatedAt :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON BalanceSheet where
  parseJSON = withObject "BalanceSheet" $ \obj -> do
    assets <- obj .: "assets"
    createdAt <- obj .: "created_at"
    currencyCode <- obj .: "currency_code"
    endDate <- obj .: "end_date"
    equity <- obj .: "equity"
    id <- obj .: "id"
    liabilities <- obj .: "liabilities"
    platformData <- obj .: "platform_data"
    startDate <- obj .: "start_date"
    totalAssets <- obj .: "total_assets"
    totalEquity <- obj .: "total_equity"
    totalLiabilities <- obj .: "total_liabilities"
    updatedAt <- obj .: "updated_at"
    pure $ BalanceSheet{..}

instance ToJSON BalanceSheet where
  toJSON BalanceSheet{..} =
    object [
      "assets" .= assets,
      "created_at" .= createdAt,
      "currency_code" .= currencyCode,
      "end_date" .= endDate,
      "equity" .= equity,
      "id" .= id,
      "liabilities" .= liabilities,
      "platform_data" .= platformData,
      "start_date" .= startDate,
      "total_assets" .= totalAssets,
      "total_equity" .= totalEquity,
      "total_liabilities" .= totalLiabilities,
      "updated_at" .= updatedAt
    ]
