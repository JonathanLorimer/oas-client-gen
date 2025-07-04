{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteInvoiceResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse29 (AsyncResponse29)

data AsyncDeleteInvoiceResponse1 = AsyncDeleteInvoiceResponse1
  { asyncResponse :: AsyncResponse29
  }
  deriving (Show, Eq)

instance FromJSON AsyncDeleteInvoiceResponse1 where
  parseJSON = withObject "AsyncDeleteInvoiceResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ AsyncDeleteInvoiceResponse1{..}

instance ToJSON AsyncDeleteInvoiceResponse1 where
  toJSON AsyncDeleteInvoiceResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
