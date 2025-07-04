{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Expenses where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields19 (AdditionalFields19)
import Types.AdditionalFields20 (AdditionalFields20)
import Types.AsyncResponse20 (AsyncResponse20)
import Types.CreateCreateExpenseRequest (CreateCreateExpenseRequest)
import Types.CreateExpense (CreateExpense)
import Types.CreateExpenseResponse (CreateExpenseResponse)
import Types.CreateExpenseResponse1 (CreateExpenseResponse1)
import Types.Item6 (Item6)
import Types.LineItems9 (LineItems9)
import Types.CreateExpenseResponse (CreateExpenseResponse)

postAccountingExpenses :: Endpoint () CreateCreateExpenseRequest CreateExpenseResponse
postAccountingExpenses = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/expenses"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
