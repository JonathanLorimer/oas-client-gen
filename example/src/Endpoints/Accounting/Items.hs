{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Items where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields30 (AdditionalFields30)
import Types.AsyncResponse30 (AsyncResponse30)
import Types.BillItem1 (BillItem1)
import Types.CreateAccountingItemResponse (CreateAccountingItemResponse)
import Types.CreateAccountingItemResponse1 (CreateAccountingItemResponse1)
import Types.CreateCreateItemRequest (CreateCreateItemRequest)
import Types.CreateItem (CreateItem)
import Types.InvoiceItem1 (InvoiceItem1)
import Types.CreateAccountingItemResponse (CreateAccountingItemResponse)

postAccountingItems :: Endpoint () CreateCreateItemRequest CreateAccountingItemResponse
postAccountingItems = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/items"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
