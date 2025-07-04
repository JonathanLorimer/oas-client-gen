{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Orders.Id.Fulfillments where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields42 (AdditionalFields42)
import Types.AdditionalFields43 (AdditionalFields43)
import Types.AsyncResponse40 (AsyncResponse40)
import Types.CreateOrderFulfillmentBody (CreateOrderFulfillmentBody)
import Types.CreateOrderFulfillmentResponse (CreateOrderFulfillmentResponse)
import Types.CreateOrderFulfillmentResponse1 (CreateOrderFulfillmentResponse1)
import Types.Fulfillment (Fulfillment)
import Types.Fulfillment1 (Fulfillment1)
import Types.LineItems24 (LineItems24)
import Types.LineItems25 (LineItems25)
import Types.CreateOrderFulfillmentResponse (CreateOrderFulfillmentResponse)

data OrdersByIdFulfillmentsPathParams = OrdersByIdFulfillmentsPathParams
  { id :: Text }

postOrdersByIdFulfillments :: Endpoint OrdersByIdFulfillmentsPathParams CreateOrderFulfillmentBody CreateOrderFulfillmentResponse
postOrdersByIdFulfillments = Endpoint
  { method = HTTP.POST
  , path = \pathParams -> fold
      [ "/orders"
      , "/" <> pathParams.id
      , "/fulfillments"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
