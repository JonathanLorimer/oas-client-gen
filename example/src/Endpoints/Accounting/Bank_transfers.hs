{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bank_transfers where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields3 (AdditionalFields3)
import Types.AsyncResponse6 (AsyncResponse6)
import Types.CreateBankTransfer (CreateBankTransfer)
import Types.CreateBankTransferResponse (CreateBankTransferResponse)
import Types.CreateBankTransferResponse1 (CreateBankTransferResponse1)
import Types.CreateCreateBankTransferRequest (CreateCreateBankTransferRequest)
import Types.CreateBankTransferResponse (CreateBankTransferResponse)

postAccountingBankTransfers :: Endpoint () CreateCreateBankTransferRequest CreateBankTransferResponse
postAccountingBankTransfers = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/bank_transfers"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
