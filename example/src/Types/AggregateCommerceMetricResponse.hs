{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AggregateCommerceMetricResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AggregateCommerceMetricResponse = AggregateCommerceMetricResponse
  { activeCustomers :: [AggregateMetric]
  , checkpoint :: Text
  , connection :: Connection
  , refundRate :: [AggregateMetric]
  , totalOrders :: [AggregateMetric]
  , totalRevenue :: [AggregateMetric]
  }
  deriving (Show, Eq)

instance FromJSON AggregateCommerceMetricResponse where
  parseJSON = withObject "AggregateCommerceMetricResponse" $ \obj -> do
    activeCustomers <- obj .: "active_customers"
    checkpoint <- obj .: "checkpoint"
    connection <- obj .: "connection"
    refundRate <- obj .: "refund_rate"
    totalOrders <- obj .: "total_orders"
    totalRevenue <- obj .: "total_revenue"
    pure $ AggregateCommerceMetricResponse{..}

instance ToJSON AggregateCommerceMetricResponse where
  toJSON AggregateCommerceMetricResponse{..} =
    object [
      "active_customers" .= activeCustomers,
      "checkpoint" .= checkpoint,
      "connection" .= connection,
      "refund_rate" .= refundRate,
      "total_orders" .= totalOrders,
      "total_revenue" .= totalRevenue
    ]
