{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Orders where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields41 (AdditionalFields41)
import Types.BillingAddress (BillingAddress)
import Types.CreateOrderBody (CreateOrderBody)
import Types.CreateOrderResponse (CreateOrderResponse)
import Types.Customer1 (Customer1)
import Types.LineItems23 (LineItems23)
import Types.Order (Order)
import Types.ShippingAddress (ShippingAddress)

postOrders :: Endpoint () CreateOrderBody CreateOrderResponse
postOrders = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/orders" ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
