{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteInvoiceCreditMemoResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse25 (AsyncResponse25)

data AsyncDeleteInvoiceCreditMemoResponse1 = AsyncDeleteInvoiceCreditMemoResponse1
  { asyncResponse :: AsyncResponse25
  }
  deriving (Show, Eq)

instance FromJSON AsyncDeleteInvoiceCreditMemoResponse1 where
  parseJSON = withObject "AsyncDeleteInvoiceCreditMemoResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ AsyncDeleteInvoiceCreditMemoResponse1{..}

instance ToJSON AsyncDeleteInvoiceCreditMemoResponse1 where
  toJSON AsyncDeleteInvoiceCreditMemoResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
