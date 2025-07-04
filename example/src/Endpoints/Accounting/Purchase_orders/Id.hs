{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Purchase_orders.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AsyncDeletePurchaseOrderResponseResponse (AsyncDeletePurchaseOrderResponseResponse)
import Types.AsyncDeletePurchaseOrderResponseResponse1 (AsyncDeletePurchaseOrderResponseResponse1)
import Types.AsyncResponse36 (AsyncResponse36)
import Types.AsyncDeletePurchaseOrderResponseResponse (AsyncDeletePurchaseOrderResponseResponse)

data AccountingPurchaseOrdersByIdPathParams = AccountingPurchaseOrdersByIdPathParams
  { id :: Text }

deleteAccountingPurchaseOrdersById :: Endpoint AccountingPurchaseOrdersByIdPathParams AsyncWriteParams AsyncDeletePurchaseOrderResponseResponse
deleteAccountingPurchaseOrdersById = Endpoint
  { method = HTTP.DELETE
  , path = \pathParams -> fold
      [ "/accounting"
      , "/purchase_orders"
      , "/" <> pathParams.id
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
