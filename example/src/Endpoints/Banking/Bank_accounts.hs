{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Banking.Bank_accounts where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP
import Data.Map (Map)
import Data.Aeson (Value)

import Types.Balance1 (Balance1)
import Types.BankAccount (BankAccount)
import Types.ListBankAccountResponseWithConnection (ListBankAccountResponseWithConnection)

getBankingBankAccounts :: Endpoint () () ListBankAccountResponseWithConnection
getBankingBankAccounts = Endpoint
  { method = HTTP.GET
  , path = const $ fold
      [ "/banking"
      , "/bank_accounts"
      ]
  , toRequestBody = const L.empty
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
