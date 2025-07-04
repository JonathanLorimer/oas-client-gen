{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Banking.Bank_accounts.Id.Details where

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

import Types.Ach (Ach)
import Types.BankAccountDetails (BankAccountDetails)
import Types.BankAccountDetailsResponseWithConnection (BankAccountDetailsResponseWithConnection)

data BankingBankAccountsByIdDetailsPathParams = BankingBankAccountsByIdDetailsPathParams
  { id :: Text }

getBankingBankAccountsByIdDetails :: Endpoint BankingBankAccountsByIdDetailsPathParams () BankAccountDetailsResponseWithConnection
getBankingBankAccountsByIdDetails = Endpoint
  { method = HTTP.GET
  , path = \pathParams -> fold
      [ "/banking"
      , "/bank_accounts"
      , "/" <> pathParams.id
      , "/details"
      ]
  , toRequestBody = const L.empty
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
