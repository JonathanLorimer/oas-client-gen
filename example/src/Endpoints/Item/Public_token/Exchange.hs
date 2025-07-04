{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Item.Public_token.Exchange where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.ExchangeTokenBody (ExchangeTokenBody)
import Types.ExchangeTokenResponse (ExchangeTokenResponse)

postItemPublicTokenExchange :: Endpoint () ExchangeTokenBody ExchangeTokenResponse
postItemPublicTokenExchange = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/item"
      , "/public_token"
      , "/exchange"
      ]
  , toRequestBody = A.encode
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
