{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateInvoicePaymentResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse26 (AsyncResponse26)

data CreateInvoicePaymentResponse1 = CreateInvoicePaymentResponse1
  { asyncResponse :: AsyncResponse26
  }
  deriving (Show, Eq)

instance FromJSON CreateInvoicePaymentResponse1 where
  parseJSON = withObject "CreateInvoicePaymentResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateInvoicePaymentResponse1{..}

instance ToJSON CreateInvoicePaymentResponse1 where
  toJSON CreateInvoicePaymentResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
