{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Tax_agencies.Id where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.TaxAgencyResponseWithConnection (TaxAgencyResponseWithConnection)

data AccountingTaxAgenciesByIdPathParams = AccountingTaxAgenciesByIdPathParams
  { id :: Text }

getAccountingTaxAgenciesById :: Endpoint AccountingTaxAgenciesByIdPathParams () TaxAgencyResponseWithConnection
getAccountingTaxAgenciesById = Endpoint
  { method = HTTP.GET
  , path = \pathParams -> fold
      [ "/accounting"
      , "/tax_agencies"
      , "/" <> pathParams.id
      ]
  , toRequestBody = const L.empty
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
