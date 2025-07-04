{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Items.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AsyncDeleteItemResponse (AsyncDeleteItemResponse)
import Types.AsyncDeleteItemResponse1 (AsyncDeleteItemResponse1)
import Types.AsyncResponse31 (AsyncResponse31)
import Types.AsyncDeleteItemResponse (AsyncDeleteItemResponse)

data AccountingItemsByIdPathParams = AccountingItemsByIdPathParams
  { id :: Text }

deleteAccountingItemsById :: Endpoint AccountingItemsByIdPathParams AsyncWriteParams AsyncDeleteItemResponse
deleteAccountingItemsById = Endpoint
  { method = HTTP.DELETE
  , path = \pathParams -> fold
      [ "/accounting"
      , "/items"
      , "/" <> pathParams.id
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
