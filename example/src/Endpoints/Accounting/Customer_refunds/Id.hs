{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Customer_refunds.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AsyncDeleteAccountingCustomerRefundResponse (AsyncDeleteAccountingCustomerRefundResponse)
import Types.AsyncDeleteAccountingCustomerRefundResponse1 (AsyncDeleteAccountingCustomerRefundResponse1)
import Types.AsyncResponse17 (AsyncResponse17)
import Types.AsyncDeleteAccountingCustomerRefundResponse (AsyncDeleteAccountingCustomerRefundResponse)

data AccountingCustomerRefundsByIdPathParams = AccountingCustomerRefundsByIdPathParams
  { id :: Text }

deleteAccountingCustomerRefundsById :: Endpoint AccountingCustomerRefundsByIdPathParams AsyncWriteParams AsyncDeleteAccountingCustomerRefundResponse
deleteAccountingCustomerRefundsById = Endpoint
  { method = HTTP.DELETE
  , path = \pathParams -> fold
      [ "/accounting"
      , "/customer_refunds"
      , "/" <> pathParams.id
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
