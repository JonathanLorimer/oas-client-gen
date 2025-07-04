{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteAccountingCustomerRefundResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse17 (AsyncResponse17)

data AsyncDeleteAccountingCustomerRefundResponse1 = AsyncDeleteAccountingCustomerRefundResponse1
  { asyncResponse :: AsyncResponse17
  }
  deriving (Show, Eq)

instance FromJSON AsyncDeleteAccountingCustomerRefundResponse1 where
  parseJSON = withObject "AsyncDeleteAccountingCustomerRefundResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ AsyncDeleteAccountingCustomerRefundResponse1{..}

instance ToJSON AsyncDeleteAccountingCustomerRefundResponse1 where
  toJSON AsyncDeleteAccountingCustomerRefundResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
