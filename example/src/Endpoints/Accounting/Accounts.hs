{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Accounts where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields (AdditionalFields)
import Types.AsyncResponse (AsyncResponse)
import Types.CreateAccount (CreateAccount)
import Types.CreateAccountResponse (CreateAccountResponse)
import Types.CreateAccountResponse1 (CreateAccountResponse1)
import Types.CreateCreateAccountRequest (CreateCreateAccountRequest)
import Types.CreateAccountResponse (CreateAccountResponse)

postAccountingAccounts :: Endpoint () CreateCreateAccountRequest CreateAccountResponse
postAccountingAccounts = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/accounts"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
