{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bank_deposits where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields1 (AdditionalFields1)
import Types.AsyncResponse2 (AsyncResponse2)
import Types.CreateBankDeposit (CreateBankDeposit)
import Types.CreateBankDepositResponse (CreateBankDepositResponse)
import Types.CreateBankDepositResponse1 (CreateBankDepositResponse1)
import Types.CreateCreateBankDepositRequest (CreateCreateBankDepositRequest)
import Types.LineItems1 (LineItems1)
import Types.LinkedPayments1 (LinkedPayments1)
import Types.CreateBankDepositResponse (CreateBankDepositResponse)

postAccountingBankDeposits :: Endpoint () CreateCreateBankDepositRequest CreateBankDepositResponse
postAccountingBankDeposits = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/bank_deposits"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
