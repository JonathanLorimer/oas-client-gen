{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteBillPaymentResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse11 (AsyncResponse11)

data AsyncDeleteBillPaymentResponse1 = AsyncDeleteBillPaymentResponse1
  { asyncResponse :: AsyncResponse11
  }
  deriving (Show, Eq)

instance FromJSON AsyncDeleteBillPaymentResponse1 where
  parseJSON = withObject "AsyncDeleteBillPaymentResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ AsyncDeleteBillPaymentResponse1{..}

instance ToJSON AsyncDeleteBillPaymentResponse1 where
  toJSON AsyncDeleteBillPaymentResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
