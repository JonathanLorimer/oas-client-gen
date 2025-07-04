{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateAccountingCustomerRefundResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse16 (AsyncResponse16)

data CreateAccountingCustomerRefundResponse1 = CreateAccountingCustomerRefundResponse1
  { asyncResponse :: AsyncResponse16
  }
  deriving (Show, Eq)

instance FromJSON CreateAccountingCustomerRefundResponse1 where
  parseJSON = withObject "CreateAccountingCustomerRefundResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateAccountingCustomerRefundResponse1{..}

instance ToJSON CreateAccountingCustomerRefundResponse1 where
  toJSON CreateAccountingCustomerRefundResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
