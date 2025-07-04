{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Classes where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.AsyncResponse15 (AsyncResponse15)
import Types.CreateClass (CreateClass)
import Types.CreateClassResponse (CreateClassResponse)
import Types.CreateClassResponse1 (CreateClassResponse1)
import Types.CreateCreateClassRequest (CreateCreateClassRequest)
import Types.CreateClassResponse (CreateClassResponse)

postAccountingClasses :: Endpoint () CreateCreateClassRequest CreateClassResponse
postAccountingClasses = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/classes"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
