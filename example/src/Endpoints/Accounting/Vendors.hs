{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Vendors where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields40 (AdditionalFields40)
import Types.Addresses5 (Addresses5)
import Types.AsyncResponse39 (AsyncResponse39)
import Types.CreateCreateVendorRequest (CreateCreateVendorRequest)
import Types.CreateVendor (CreateVendor)
import Types.CreateVendorResponse (CreateVendorResponse)
import Types.CreateVendorResponse1 (CreateVendorResponse1)
import Types.Subsidiaries5 (Subsidiaries5)
import Types.CreateVendorResponse (CreateVendorResponse)

postAccountingVendors :: Endpoint () CreateCreateVendorRequest CreateVendorResponse
postAccountingVendors = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/vendors"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
