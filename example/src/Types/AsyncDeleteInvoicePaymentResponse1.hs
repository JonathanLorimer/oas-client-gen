{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteInvoicePaymentResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse27 (AsyncResponse27)

data AsyncDeleteInvoicePaymentResponse1 = AsyncDeleteInvoicePaymentResponse1
  { asyncResponse :: AsyncResponse27
  }
  deriving (Show, Eq)

instance FromJSON AsyncDeleteInvoicePaymentResponse1 where
  parseJSON = withObject "AsyncDeleteInvoicePaymentResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ AsyncDeleteInvoicePaymentResponse1{..}

instance ToJSON AsyncDeleteInvoicePaymentResponse1 where
  toJSON AsyncDeleteInvoicePaymentResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
