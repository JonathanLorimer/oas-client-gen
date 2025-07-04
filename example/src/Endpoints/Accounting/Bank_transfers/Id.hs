{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bank_transfers.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AsyncDeleteBankTransferResponse (AsyncDeleteBankTransferResponse)
import Types.AsyncDeleteBankTransferResponse1 (AsyncDeleteBankTransferResponse1)
import Types.AsyncResponse7 (AsyncResponse7)
import Types.AsyncDeleteBankTransferResponse (AsyncDeleteBankTransferResponse)

data AccountingBankTransfersByIdPathParams = AccountingBankTransfersByIdPathParams
  { id :: Text }

deleteAccountingBankTransfersById :: Endpoint AccountingBankTransfersByIdPathParams AsyncWriteParams AsyncDeleteBankTransferResponse
deleteAccountingBankTransfersById = Endpoint
  { method = HTTP.DELETE
  , path = \pathParams -> fold
      [ "/accounting"
      , "/bank_transfers"
      , "/" <> pathParams.id
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
