{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Customers where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields17 (AdditionalFields17)
import Types.Addresses1 (Addresses1)
import Types.AsyncResponse18 (AsyncResponse18)
import Types.CreateAccountingCustomer (CreateAccountingCustomer)
import Types.CreateAccountingCustomerResponse (CreateAccountingCustomerResponse)
import Types.CreateAccountingCustomerResponse1 (CreateAccountingCustomerResponse1)
import Types.CreateCreateAccountingCustomerRequest (CreateCreateAccountingCustomerRequest)
import Types.CreateAccountingCustomerResponse (CreateAccountingCustomerResponse)

postAccountingCustomers :: Endpoint () CreateCreateAccountingCustomerRequest CreateAccountingCustomerResponse
postAccountingCustomers = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/customers"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
