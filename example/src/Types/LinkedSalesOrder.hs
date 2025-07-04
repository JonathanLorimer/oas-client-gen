{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedSalesOrder where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedSalesOrder = LinkedSalesOrder
  { salesOrderLinePlatformId :: Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedSalesOrder where
  parseJSON = withObject "LinkedSalesOrder" $ \obj -> do
    salesOrderLinePlatformId <- obj .: "sales_order_line_platform_id"
    pure $ LinkedSalesOrder{..}

instance ToJSON LinkedSalesOrder where
  toJSON LinkedSalesOrder{..} =
    object [
      "sales_order_line_platform_id" .= salesOrderLinePlatformId
    ]
