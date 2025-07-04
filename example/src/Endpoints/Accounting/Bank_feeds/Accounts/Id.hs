{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bank_feeds.Accounts.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AsyncDeleteBankFeedAccountResponse (AsyncDeleteBankFeedAccountResponse)
import Types.AsyncDeleteBankFeedAccountResponse1 (AsyncDeleteBankFeedAccountResponse1)
import Types.AsyncResponse5 (AsyncResponse5)
import Types.AsyncDeleteBankFeedAccountResponse (AsyncDeleteBankFeedAccountResponse)

data AccountingBankFeedsAccountsByIdPathParams = AccountingBankFeedsAccountsByIdPathParams
  { id :: Text }

deleteAccountingBankFeedsAccountsById :: Endpoint AccountingBankFeedsAccountsByIdPathParams AsyncWriteParams AsyncDeleteBankFeedAccountResponse
deleteAccountingBankFeedsAccountsById = Endpoint
  { method = HTTP.DELETE
  , path = \pathParams -> fold
      [ "/accounting"
      , "/bank_feeds"
      , "/accounts"
      , "/" <> pathParams.id
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
