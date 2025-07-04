{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Company_info where

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

import Types.AdditionalFields13 (AdditionalFields13)
import Types.CompanyInfo20240430 (CompanyInfo20240430)
import Types.CompanyInfo20240430ResponseWithConnection (CompanyInfo20240430ResponseWithConnection)

getAccountingCompanyInfo :: Endpoint () () CompanyInfo20240430ResponseWithConnection
getAccountingCompanyInfo = Endpoint
  { method = HTTP.GET
  , path = const $ fold
      [ "/accounting"
      , "/company_info"
      ]
  , toRequestBody = const L.empty
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
