{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Entitytype where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.CreateEntityWithCustomFieldsPage (CreateEntityWithCustomFieldsPage)
import Types.CreateEntityWithCustomFieldsPageResponse (CreateEntityWithCustomFieldsPageResponse)
import Types.CustomFields (CustomFields)
import Types.CustomFields1 (CustomFields1)
import Types.LineItems21 (LineItems21)
import Types.LineItems22 (LineItems22)
import Types.PlatformData (PlatformData)
import Types.SublistKey (SublistKey)

data AccountingByEntityTypePathParams = AccountingByEntityTypePathParams
  { entityType :: Text }

postAccountingByEntityType :: Endpoint AccountingByEntityTypePathParams CreateEntityWithCustomFieldsPage CreateEntityWithCustomFieldsPageResponse
postAccountingByEntityType = Endpoint
  { method = HTTP.POST
  , path = \pathParams -> fold
      [ "/accounting"
      , "/" <> pathParams.entityType
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
