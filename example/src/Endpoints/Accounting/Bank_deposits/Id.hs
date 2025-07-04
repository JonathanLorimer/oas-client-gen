{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bank_deposits.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AsyncDeleteBankDepositResponse (AsyncDeleteBankDepositResponse)
import Types.AsyncDeleteBankDepositResponse1 (AsyncDeleteBankDepositResponse1)
import Types.AsyncResponse3 (AsyncResponse3)
import Types.AsyncWriteParams (AsyncWriteParams)
import Types.AsyncDeleteBankDepositResponse (AsyncDeleteBankDepositResponse)

data AccountingBankDepositsByIdPathParams = AccountingBankDepositsByIdPathParams
  { id :: Text }

deleteAccountingBankDepositsById :: Endpoint AccountingBankDepositsByIdPathParams AsyncWriteParams AsyncDeleteBankDepositResponse
deleteAccountingBankDepositsById = Endpoint
  { method = HTTP.DELETE
  , path = \pathParams -> fold
      [ "/accounting"
      , "/bank_deposits"
      , "/" <> pathParams.id
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
