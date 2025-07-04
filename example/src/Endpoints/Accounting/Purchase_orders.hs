{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Purchase_orders where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP
import Data.Map (Map)
import Data.Aeson (Value)

import Types.AdditionalFields35 (AdditionalFields35)
import Types.AsyncResponse35 (AsyncResponse35)
import Types.CreateCreatePurchaseOrderRequest (CreateCreatePurchaseOrderRequest)
import Types.CreatePurchaseOrder (CreatePurchaseOrder)
import Types.CreatePurchaseOrder20230207Response (CreatePurchaseOrder20230207Response)
import Types.CreatePurchaseOrder20230207Response1 (CreatePurchaseOrder20230207Response1)
import Types.LineItems17 (LineItems17)
import Types.LineItems18 (LineItems18)
import Types.PurchaseOrder20230207 (PurchaseOrder20230207)
import Types.CreatePurchaseOrder20230207Response (CreatePurchaseOrder20230207Response)

postAccountingPurchaseOrders :: Endpoint () CreateCreatePurchaseOrderRequest CreatePurchaseOrder20230207Response
postAccountingPurchaseOrders = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/purchase_orders"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
