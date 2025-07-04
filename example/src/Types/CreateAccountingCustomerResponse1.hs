{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateAccountingCustomerResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse18 (AsyncResponse18)

data CreateAccountingCustomerResponse1 = CreateAccountingCustomerResponse1
  { asyncResponse :: AsyncResponse18
  }
  deriving (Show, Eq)

instance FromJSON CreateAccountingCustomerResponse1 where
  parseJSON = withObject "CreateAccountingCustomerResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateAccountingCustomerResponse1{..}

instance ToJSON CreateAccountingCustomerResponse1 where
  toJSON CreateAccountingCustomerResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
