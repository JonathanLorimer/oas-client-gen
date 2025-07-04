{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Endpoints.Accounting.Bank_feeds.Otp where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable
import Data.Bifunctor
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import OAS.Base.Endpoint
import qualified Network.HTTP.Types as HTTP

import Types.BankFeedOtp (BankFeedOtp)
import Types.BankFeedOtpResponse (BankFeedOtpResponse)

postAccountingBankFeedsOtp :: Endpoint () () BankFeedOtpResponse
postAccountingBankFeedsOtp = Endpoint
  { method = HTTP.POST
  , path = const $ fold
      [ "/accounting"
      , "/bank_feeds"
      , "/otp"
      ]
  , toRequestBody = const L.empty
  , fromResponseBody = \case
      200 -> \bs -> first (ParseError 200 . L8.pack) $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs

  }
