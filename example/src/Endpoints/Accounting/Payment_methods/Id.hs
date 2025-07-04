{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Payment_methods.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.PaymentMethodResponseWithConnection (PaymentMethodResponseWithConnection)

data AccountingPaymentMethodsByIdPathParams = AccountingPaymentMethodsByIdPathParams
  { id :: Text }

getAccountingPaymentMethodsById :: Endpoint AccountingPaymentMethodsByIdPathParams () PaymentMethodResponseWithConnection
getAccountingPaymentMethodsById = Endpoint
  { method = HTTP.GET
  , path = \pathParams -> fold
      [ "/accounting"
      , "/payment_methods"
      , "/" <> pathParams.id
      ]
  , toRequestBody = const L.empty
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
