{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Payment_terms.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AsyncDeletePaymentTermResponse (AsyncDeletePaymentTermResponse)
import Types.AsyncDeletePaymentTermResponse1 (AsyncDeletePaymentTermResponse1)
import Types.AsyncResponse34 (AsyncResponse34)
import Types.AsyncDeletePaymentTermResponse (AsyncDeletePaymentTermResponse)

data AccountingPaymentTermsByIdPathParams = AccountingPaymentTermsByIdPathParams
  { id :: Text }

deleteAccountingPaymentTermsById :: Endpoint AccountingPaymentTermsByIdPathParams AsyncWriteParams AsyncDeletePaymentTermResponse
deleteAccountingPaymentTermsById = Endpoint
  { method = HTTP.DELETE
  , path = \pathParams -> fold
      [ "/accounting"
      , "/payment_terms"
      , "/" <> pathParams.id
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
