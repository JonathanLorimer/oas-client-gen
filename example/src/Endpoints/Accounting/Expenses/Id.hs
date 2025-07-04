{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Expenses.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AsyncDeleteExpenseResponse (AsyncDeleteExpenseResponse)
import Types.AsyncDeleteExpenseResponse1 (AsyncDeleteExpenseResponse1)
import Types.AsyncResponse21 (AsyncResponse21)
import Types.AsyncDeleteExpenseResponse (AsyncDeleteExpenseResponse)

data AccountingExpensesByIdPathParams = AccountingExpensesByIdPathParams
  { id :: Text }

deleteAccountingExpensesById :: Endpoint AccountingExpensesByIdPathParams AsyncWriteParams AsyncDeleteExpenseResponse
deleteAccountingExpensesById = Endpoint
  { method = HTTP.DELETE
  , path = \pathParams -> fold
      [ "/accounting"
      , "/expenses"
      , "/" <> pathParams.id
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
