{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bank_feeds.Accounts where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields2 (AdditionalFields2)
import Types.AsyncResponse4 (AsyncResponse4)
import Types.CreateBankFeedAccount (CreateBankFeedAccount)
import Types.CreateBankFeedAccountResponse (CreateBankFeedAccountResponse)
import Types.CreateBankFeedAccountResponse1 (CreateBankFeedAccountResponse1)
import Types.CreateCreateBankFeedAccountRequest (CreateCreateBankFeedAccountRequest)
import Types.CreateBankFeedAccountResponse (CreateBankFeedAccountResponse)

postAccountingBankFeedsAccounts :: Endpoint () CreateCreateBankFeedAccountRequest CreateBankFeedAccountResponse
postAccountingBankFeedsAccounts = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/bank_feeds"
      , "/accounts"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
