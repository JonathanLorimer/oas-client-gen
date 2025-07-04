{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Entities where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Orders (Orders)
import Types.Products (Products)
import Types.Variants (Variants)
import Types.Orders (Orders)
import Types.Products (Products)

data Entities = Entities
  { accounts :: Text
  , balanceSheets :: Text
  , companyInfo :: Text
  , customers :: Text
  , incomeStatements :: Text
  , invoices :: Text
  , items :: Text
  , orders :: Orders
  , payouts :: Text
  , products :: Products
  , purchaseOrders :: Text
  , store :: Text
  , transactions :: Text
  , vendors :: Text
  }
  deriving (Show, Eq)

instance FromJSON Entities where
  parseJSON = withObject "Entities" $ \obj -> do
    accounts <- obj .: "accounts"
    balanceSheets <- obj .: "balanceSheets"
    companyInfo <- obj .: "companyInfo"
    customers <- obj .: "customers"
    incomeStatements <- obj .: "incomeStatements"
    invoices <- obj .: "invoices"
    items <- obj .: "items"
    orders <- obj .: "orders"
    payouts <- obj .: "payouts"
    products <- obj .: "products"
    purchaseOrders <- obj .: "purchaseOrders"
    store <- obj .: "store"
    transactions <- obj .: "transactions"
    vendors <- obj .: "vendors"
    pure $ Entities{..}

instance ToJSON Entities where
  toJSON Entities{..} =
    object [
      "accounts" .= accounts,
      "balanceSheets" .= balanceSheets,
      "companyInfo" .= companyInfo,
      "customers" .= customers,
      "incomeStatements" .= incomeStatements,
      "invoices" .= invoices,
      "items" .= items,
      "orders" .= orders,
      "payouts" .= payouts,
      "products" .= products,
      "purchaseOrders" .= purchaseOrders,
      "store" .= store,
      "transactions" .= transactions,
      "vendors" .= vendors
    ]
