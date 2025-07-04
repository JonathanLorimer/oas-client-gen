{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Products.Id.Variants where

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

import Types.CreateVariantBody (CreateVariantBody)
import Types.CurrencyPrices1 (CurrencyPrices1)
import Types.Images4 (Images4)
import Types.Images5 (Images5)
import Types.Inventory2 (Inventory2)
import Types.Inventory3 (Inventory3)
import Types.LinkedProducts1 (LinkedProducts1)
import Types.Locations1 (Locations1)
import Types.OptionValues2 (OptionValues2)
import Types.OptionValues3 (OptionValues3)
import Types.Variant (Variant)
import Types.Variant1 (Variant1)
import Types.VariantResponse (VariantResponse)
import Types.Weight2 (Weight2)
import Types.Weight3 (Weight3)

data ProductsByIdVariantsPathParams = ProductsByIdVariantsPathParams
  { id :: Text }

postProductsByIdVariants :: Endpoint ProductsByIdVariantsPathParams CreateVariantBody VariantResponse
postProductsByIdVariants = Endpoint
  { method = HTTP.POST
  , path = \pathParams -> fold
      [ "/products"
      , "/" <> pathParams.id
      , "/variants"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
