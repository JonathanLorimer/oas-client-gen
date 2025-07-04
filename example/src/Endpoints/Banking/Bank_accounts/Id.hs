{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Banking.Bank_accounts.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.BankAccountResponseWithConnection (BankAccountResponseWithConnection)

data BankingBankAccountsByIdPathParams = BankingBankAccountsByIdPathParams
  { id :: Text }

getBankingBankAccountsById :: Endpoint BankingBankAccountsByIdPathParams () BankAccountResponseWithConnection
getBankingBankAccountsById = Endpoint
  { method = HTTP.GET
  , path = \pathParams -> fold
      [ "/banking"
      , "/bank_accounts"
      , "/" <> pathParams.id
      ]
  , toRequestBody = const L.empty
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
