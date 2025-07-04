{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateInvoiceCreditMemoResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse24 (AsyncResponse24)

data CreateInvoiceCreditMemoResponse1 = CreateInvoiceCreditMemoResponse1
  { asyncResponse :: AsyncResponse24
  }
  deriving (Show, Eq)

instance FromJSON CreateInvoiceCreditMemoResponse1 where
  parseJSON = withObject "CreateInvoiceCreditMemoResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateInvoiceCreditMemoResponse1{..}

instance ToJSON CreateInvoiceCreditMemoResponse1 where
  toJSON CreateInvoiceCreditMemoResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
