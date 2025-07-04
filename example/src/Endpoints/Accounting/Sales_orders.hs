{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Sales_orders where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields37 (AdditionalFields37)
import Types.AsyncResponse37 (AsyncResponse37)
import Types.CreateCreateSalesOrderRequest (CreateCreateSalesOrderRequest)
import Types.CreateSalesOrder (CreateSalesOrder)
import Types.CreateSalesOrderResponse (CreateSalesOrderResponse)
import Types.CreateSalesOrderResponse1 (CreateSalesOrderResponse1)
import Types.Item12 (Item12)
import Types.LineItems20 (LineItems20)
import Types.CreateSalesOrderResponse (CreateSalesOrderResponse)

postAccountingSalesOrders :: Endpoint () CreateCreateSalesOrderRequest CreateSalesOrderResponse
postAccountingSalesOrders = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/sales_orders"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
