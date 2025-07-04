{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Departments where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AsyncResponse19 (AsyncResponse19)
import Types.CreateCreateDepartmentRequest (CreateCreateDepartmentRequest)
import Types.CreateDepartment (CreateDepartment)
import Types.CreateDepartmentResponse (CreateDepartmentResponse)
import Types.CreateDepartmentResponse1 (CreateDepartmentResponse1)
import Types.CreateDepartmentResponse (CreateDepartmentResponse)

postAccountingDepartments :: Endpoint () CreateCreateDepartmentRequest CreateDepartmentResponse
postAccountingDepartments = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/departments"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
