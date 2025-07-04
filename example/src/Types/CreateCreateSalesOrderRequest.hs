{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateSalesOrderRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields37 (AdditionalFields37)
import Types.CreateSalesOrder (CreateSalesOrder)
import Types.Item12 (Item12)
import Types.LineItems20 (LineItems20)

data CreateCreateSalesOrderRequest = CreateCreateSalesOrderRequest
  { responseMode :: Text
  , salesOrder :: CreateSalesOrder
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateSalesOrderRequest where
  parseJSON = withObject "CreateCreateSalesOrderRequest" $ \obj -> do
    responseMode <- obj .: "response_mode"
    salesOrder <- obj .: "sales_order"
    pure $ CreateCreateSalesOrderRequest{..}

instance ToJSON CreateCreateSalesOrderRequest where
  toJSON CreateCreateSalesOrderRequest{..} =
    object [
      "response_mode" .= responseMode,
      "sales_order" .= salesOrder
    ]
