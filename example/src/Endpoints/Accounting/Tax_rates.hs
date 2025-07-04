{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Tax_rates where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AdditionalFields39 (AdditionalFields39)
import Types.AsyncResponse38 (AsyncResponse38)
import Types.Components1 (Components1)
import Types.CreateCreateTaxRateRequest (CreateCreateTaxRateRequest)
import Types.CreateTaxRate (CreateTaxRate)
import Types.CreateTaxRateResponse (CreateTaxRateResponse)
import Types.CreateTaxRateResponse1 (CreateTaxRateResponse1)
import Types.CreateTaxRateResponse (CreateTaxRateResponse)

postAccountingTaxRates :: Endpoint () CreateCreateTaxRateRequest CreateTaxRateResponse
postAccountingTaxRates = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/tax_rates"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
