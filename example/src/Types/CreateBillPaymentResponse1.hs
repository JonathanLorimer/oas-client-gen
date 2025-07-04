{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBillPaymentResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse10 (AsyncResponse10)

data CreateBillPaymentResponse1 = CreateBillPaymentResponse1
  { asyncResponse :: AsyncResponse10
  }
  deriving (Show, Eq)

instance FromJSON CreateBillPaymentResponse1 where
  parseJSON = withObject "CreateBillPaymentResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateBillPaymentResponse1{..}

instance ToJSON CreateBillPaymentResponse1 where
  toJSON CreateBillPaymentResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
